# MEERA (`com.meera.android`) — Master Memory, Full APK Map & Multi-Account Checkpoint File

## Copy-Paste Resume Prompt (Naye Gemini Account Ke Liye)
Main apna Android Kotlin project "Meera" (com.meera.android) bana raha hoon jo Maya v5.2.39 ke reverse-engineered architecture par based hai. Is repo mein MEERA_MASTER_MEMORY_AND_PROGRESS.md padho. Phase 1 se Phase 9 tak ke saare core modules pure Kotlin (1.9.24+, JVM 17, Jetpack Compose, Coroutines, StateFlow, DataStore, OkHttp, TensorFlow Lite, OpenGL ES 2.0) mein 100% complete ho chuke hain.

## 1. Module Progress Checklist
- [x] Phase 1: Full APK Reverse Engineering & Bytecode De-obfuscation (`maya-v5.2.39.apk`)
- [x] Phase 2: Core Kotlin Architecture (`MeeraCoreArchitecture.kt`)
- [x] Phase 3: FastAPI + ECDSA Backend Server (`meera_backend_server.py`)
- [x] Phase 4: Complete Gradle Project & `AndroidManifest.xml` (`com.meera.android`)
- [x] Phase 5: On-Device Wake-Word & Voice Guardian TFLite Engine (`MeeraWakeWordAndGuardian.kt`)
- [x] Phase 6: On-Device Neural TTS (`PocketTtsEngine.kt`) & Turn/Addressee Detector (`TurnDetectorEngine.kt`)
- [x] Phase 7: AI Agent Loop, Multi-LLM Router & 327 Tool Executor (`MeeraAgentOrchestrator.kt` & `MeeraToolRegistry.kt`)
- [x] Phase 8: FaceLock, Intruder Watchman (`FaceLockAndWatchmanEngine.kt`) & Live Video Avatar OpenGL Renderer (`MeeraAvatarRenderer.kt`)
- [x] Phase 9: Jetpack Compose UI Screens, Settings DataStore & 24/7 Services (`MainActivity.kt` & `MeeraSystemServices.kt`)

## 2. Core Architecture & Bytecode Reference
- Package: `com.meera.android` (Kotlin 1.9.24, Gradle 8.7, JVM Target 17, minSdk 26, targetSdk 34)
- Native JNI: `libonnxruntime.so`, `libpockettts_jni.so` (`PocketTtsNative`), `libturndetector_jni.so` (`TurnNative`), `libtensorflowlite_jni.so`
- Bundled Assets: `assets/wakeword/` (`melspectrogram.tflite`, `embedding_model.tflite`, `hey_maya.tflite`, `hello_maya.tflite`, `wake_up_maya.tflite`), `assets/guardian/silero_vad.tflite`, `assets/macros/builtin_macros.json`
- Server Offloaded Models: `/models/guardian/manifest.json` (`rdn2b6s.tflite` + `cohort_rdn2b6s.bin`), `/models/turn/manifest.json` (`model.onnx` + `pieces.tsv`), `/models/addressee/manifest.json`, `/models/face/v1/` (`yunet_640.tflite` + `sface_w8.tflite`), `/models/tts/dost/v2/` (`.mvp` graphs + 14 emotion voices), `/avatar/catalog.json`
- Server APIs: `POST /api/android/bootstrap`, `POST /api/android/heartbeat`, `POST /api/license/verify-android` (ECDSA P-256 SHA256withECDSA signed `{payload, sig, v}`), `POST /tts/v1/speak`, `WS /home/ws`

## 3. Complete File-to-Package Map (Phases 4–9)
1. `app/src/main/AndroidManifest.xml` — All permissions, `<queries>`, 8 Activities, 7 Services, and 7 BroadcastReceivers.
2. `app/src/main/java/com/meera/android/voice/MeeraWakeWordAndGuardian.kt` — `SpeechGate` (Silero VAD v4), `WakeWordEngine` (5-model TFLite), `VoiceGuardianVerifier` (ReDimNet2-B6 3-second voiced window + logistic calibration).
3. `app/src/main/java/com/meera/android/voice/PocketTtsEngine.kt` — `PocketTtsNative` JNI, 14 `MeeraVoiceEmotion` styles, 3-tier 24kHz PCM synthesis (On-Device PocketTTS -> Gemini `Aoede` / `/tts/v1/speak` -> Android `TextToSpeech` `hi-IN`) with real-time lip-sync RMS and instant barge-in abort.
4. `app/src/main/java/com/meera/android/voice/TurnDetectorEngine.kt` — `TurnNative` JNI, `SentencePieceTsvTokenizer` (`pieces.tsv`), and adaptive End-of-Turn + Addressee detector (`280 ms` to `1650 ms` dynamic silence window).
5. `app/src/main/java/com/meera/android/agent/MeeraAgentOrchestrator.kt` — `EcdsaLicenseVerifier` (`SHA256withECDSA`), `MeeraMemoryVault`, `WS /home/ws` client, Multi-LLM Router (Gemini + OpenAI/Groq/DeepSeek/OpenRouter/Ollama), and 8-step ReAct loop.
6. `app/src/main/java/com/meera/android/agent/MeeraToolRegistry.kt` — All 327 Android & Cloud tools across 16 categories with `VoiceGuardianVerifier.TrustRole` enforcement and `MeeraAutomationBridge`.
7. `app/src/main/java/com/meera/android/ui/facelock/FaceLockAndWatchmanEngine.kt` — YuNet (`yunet_640.tflite`) 5-landmark detection, 112x112 similarity warp, SFace (`sface_w8.tflite`) 128-dim L2 embedding verification, Intruder selfie logger, `FaceLockActivity`, and `WatchmanActivity`.
8. `app/src/main/java/com/meera/android/wallpaper/MeeraAvatarRenderer.kt` — OpenGL ES 2.0 `MeeraAvatarGlRenderer` (RMS lip-sync, procedural eye-blink, 14-emotion shader color grading), `AvatarCatalogManager` (`/avatar/catalog.json`), and `MeeraWallpaperService`.
9. `app/src/main/java/com/meera/android/MeeraSystemServices.kt` — `MeeraApplication`, `MeeraForegroundService` (24/7 AudioRecord + Barge-in loop), `MeeraAccessibilityService`, `MeeraNotificationListener`, assistant services, and all BroadcastReceivers.
10. `app/src/main/java/com/meera/android/MainActivity.kt` — `MeeraSettingsRepository` (Jetpack DataStore), 42-particle audio-reactive Canvas Orb (`MeeraReactiveOrbCanvas`), Zero-Beep Always-On Mic stream controller, 327-tool browser, and API/Voice setup modal.
