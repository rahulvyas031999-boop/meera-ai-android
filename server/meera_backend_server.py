import base64
import json
import os
import time
from pathlib import Path
from typing import Dict, Any, Optional

from fastapi import FastAPI, Request, WebSocket, WebSocketDisconnect, Header
from fastapi.responses import JSONResponse, StreamingResponse
from fastapi.staticfiles import StaticFiles
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.asymmetric import ec

app = FastAPI(title="Meera Backend Server", version="1.0.0")

KEYS_DIR = Path("./keys")
KEYS_DIR.mkdir(exist_ok=True)
PRIV_KEY_FILE = KEYS_DIR / "meera_ec_private.pem"

if PRIV_KEY_FILE.exists():
    private_key = serialization.load_pem_private_key(PRIV_KEY_FILE.read_bytes(), password=None)
else:
    private_key = ec.generate_private_key(ec.SECP256R1())
    PRIV_KEY_FILE.write_bytes(
        private_key.private_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PrivateFormat.PKCS8,
            encryption_algorithm=serialization.NoEncryption(),
        )
    )

def get_public_key_base64_der() -> str:
    der = private_key.public_key().public_bytes(
        encoding=serialization.Encoding.DER,
        format=serialization.PublicFormat.SubjectPublicKeyInfo,
    )
    return base64.b64encode(der).decode("ascii")

def sign_server_payload(inner_payload: Dict[str, Any]) -> Dict[str, Any]:
    raw_bytes = json.dumps(inner_payload, separators=(",", ":")).encode("utf-8")
    payload_b64 = base64.b64encode(raw_bytes).decode("ascii")
    signature = private_key.sign(raw_bytes, ec.ECDSA(hashes.SHA256()))
    sig_b64 = base64.b64encode(signature).decode("ascii")
    return {"payload": payload_b64, "sig": sig_b64, "v": 1}

STATIC_ROOT = Path(os.environ.get("MEERA_STATIC_ROOT", "./www"))
for sub in ["models/guardian", "models/turn", "models/addressee", "models/face/v1", "models/tts/dost/v2", "avatar/_posters"]:
    (STATIC_ROOT / sub).mkdir(parents=True, exist_ok=True)

app.mount("/models", StaticFiles(directory=str(STATIC_ROOT / "models")), name="models")
app.mount("/avatar", StaticFiles(directory=str(STATIC_ROOT / "avatar")), name="avatar")

@app.get("/api/admin/public-key")
async def get_apk_public_key():
    return {"ec_public_key_der_base64": get_public_key_base64_der()}

@app.post("/api/android/bootstrap")
async def android_bootstrap(request: Request):
    body = await request.json()
    now = int(time.time())
    inner = {
        "v": 1,
        "nonce": body.get("nonce", ""),
        "device_id": body.get("device_id", "unknown"),
        "iat": now,
        "exp": now + 86400,
        "action": "ok",
        "entitlement": "licensed",
        "tier": "promax",
        "live": True,
        "config": {"opsEnabled": True, "server_enabled": True, "assistantName": "Meera", "voiceLowRam": False},
        "prompts": {"prompt_bundle_json": json.dumps({"system_prompt": "Tum Meera ho — smart AI assistant."})},
        "skills": {"skill_bundle_json": "[]"},
        "freeTools": {"names": "open_app_by_name,tap_text,type_text,wait_for_screen_text,read_screen_elements,go_back"},
    }
    return JSONResponse(sign_server_payload(inner))

@app.post("/api/android/heartbeat")
async def android_heartbeat(request: Request):
    body = await request.json()
    now = int(time.time())
    inner = {
        "v": 1,
        "nonce": body.get("nonce", ""),
        "device_id": body.get("device_id", "unknown"),
        "iat": now,
        "exp": now + 86400,
        "action": "ok",
        "entitlement": "licensed",
        "tier": "promax",
        "live": True,
    }
    return JSONResponse(sign_server_payload(inner))

@app.post("/tts/v1/speak")
async def cloud_tts_speak(request: Request):
    return StreamingResponse(iter([b"\x00\x00" * 8000]), media_type="application/octet-stream")

board_states: Dict[str, Dict[str, Any]] = {}

@app.websocket("/home/ws")
async def home_sync_ws(websocket: WebSocket):
    await websocket.accept()
    try:
        while True:
            msg = json.loads(await websocket.receive_text())
            t = msg.get("type", "")
            req = msg.get("req", "")
            if t == "sub":
                await websocket.send_text(json.dumps({"type": "sub.ok", "req": req}))
            elif t == "ctl":
                bid = msg.get("id", "")
                board_states.setdefault(bid, {})[str(msg.get("ch", 1))] = msg.get("action") == "on"
                await websocket.send_text(json.dumps({"type": "res", "req": req, "ok": True, "id": bid, "state": board_states[bid]}))
    except WebSocketDisconnect:
        pass
