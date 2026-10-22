#!/usr/bin/env python3
import json, os, time
from http.server import BaseHTTPRequestHandler, HTTPServer

PORT = int(os.environ.get("PORT", "8080"))
DATA_DIR = os.path.join(os.path.dirname(__file__), "data")

def load_json(fn):
    p = os.path.join(DATA_DIR, fn)
    return json.load(open(p, "r", encoding="utf-8")) if os.path.exists(p) else {}

class Handler(BaseHTTPRequestHandler):
    def _send(self, payload):
        body = json.dumps(payload, ensure_ascii=False, indent=2).encode("utf-8")
        self.send_response(200)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(body)))
        self.send_header("Access-Control-Allow-Origin", "*")
        self.end_headers()
        self.wfile.write(body)

    def do_GET(self):
        if self.path.startswith("/api/v1/lease"):
            cfg = load_json("live_remote_config.json")
            cfg["accepted_at"] = int(time.time() * 1000)
            cfg["hold_until"] = 4102444800000
            return self._send(cfg)
        if self.path.startswith("/api/v1/bundles"):
            return self._send({
                "prompt_bundle_json": load_json("prompt_bundle.json"),
                "skill_bundle_json": load_json("skill_bundle.json"),
                "live_remote_config": load_json("live_remote_config.json"),
            })
        return self._send({"service": "Meera AI Control Server", "status": "online"})

    def do_POST(self):
        return self._send({"status": "ok"})

if __name__ == "__main__":
    HTTPServer(("0.0.0.0", PORT), Handler).serve_forever()
