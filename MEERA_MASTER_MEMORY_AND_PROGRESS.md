# MEERA (`com.meera.android`) — Master Memory, Full APK Map & Multi-Account Checkpoint File

## Copy-Paste Resume Prompt (Naye Gemini Account Ke Liye)
Main apna Android Kotlin project "Meera" (com.meera.android) bana raha hoon jo Maya v5.2.39 ke reverse-engineered architecture par based hai.
Is repo mein MEERA_MASTER_MEMORY_AND_PROGRESS.md padho aur jahan tak kaam [x] Complete hai uske aage wale [ ] Pending module se pure Kotlin (1.9.24+, JVM 17, Jetpack Compose, Coroutines, StateFlow, DataStore, OkHttp) mein 100% stable code likhna shuru karo.

## 1. Module Progress Checklist
- [x] Phase 1: Full APK Reverse Engineering & Bytecode De-obfuscation (`maya-v5.2.39.apk`)
- [x] Phase 2: Core Kotlin Architecture (`MeeraCoreArchitecture.kt`)
- [x] Phase 3: FastAPI + ECDSA Backend Server (`meera_backend_server.py`)
- [x] Phase 4: Complete Gradle Project & `AndroidManifest.xml` (`com.meera.android`)
- [x] Phase 5: On-Device Wake-Word & Voice Guardian TFLite Engine (`MeeraWakeWordAndGuardian.kt`)
- [ ] Phase 6: On-Device Neural TTS (`PocketTtsEngine.kt`) & Turn/Addressee Detector (`TurnDetectorEngine.kt`)
- [ ] Phase 7: AI Agent Loop, Multi-LLM Router & 327 Tool Executor (`MeeraAgentOrchestrator.kt` & `MeeraToolRegistry.kt`)
- [ ] Phase 8: FaceLock, Intruder Watchman & Live Video Avatar OpenGL Renderer
- [ ] Phase 9: Jetpack Compose UI Screens & Settings DataStore (`MainActivity.kt`)

## 2. Core Architecture & Bytecode Reference
- Package: `com.meera.android` (Kotlin 1.9.24, Gradle 8.7, JVM Target 17, minSdk 26, targetSdk 34)
- Native JNI: `libonnxruntime.so`, `libpockettts_jni.so` (`PocketTtsNative`), `libturndetector_jni.so` (`TurnNative`), `libtensorflowlite_jni.so`
- Bundled Assets: `assets/wakeword/` (`melspectrogram.tflite`, `embedding_model.tflite`, `hey_maya.tflite`, `hello_maya.tflite`, `wake_up_maya.tflite`), `assets/guardian/silero_vad.tflite`, `assets/macros/builtin_macros.json`
- Server Offloaded Models: `/models/guardian/manifest.json` (`rdn2b6s.tflite` + `cohort_rdn2b6s.bin`), `/models/turn/manifest.json` (`model.onnx` + `pieces.tsv`), `/models/addressee/manifest.json`, `/models/face/v1/` (`yunet_640.tflite` + `sface_w8.tflite`), `/models/tts/dost/v2/` (`.mvp` graphs + 14 emotion voices), `/avatar/catalog.json`
- Server APIs: `POST /api/android/bootstrap`, `POST /api/android/heartbeat`, `POST /api/license/verify-android` (ECDSA P-256 `SHA256withECDSA` signed `{payload, sig, v}`), `POST /tts/v1/speak`, `WS /home/ws`
