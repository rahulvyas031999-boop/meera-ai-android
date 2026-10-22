package com.getmeera.android.wallpaper;

import android.content.Intent;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.service.wallpaper.WallpaperService;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import com.getmeera.android.core.MeeraForegroundService;

public final class MeeraWallpaperService extends WallpaperService {
    @Override
    public Engine onCreateEngine() {
        return new MeeraOrbEngine();
    }

    private final class MeeraOrbEngine extends Engine {
        private final Handler handler = new Handler(Looper.getMainLooper());
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private boolean visible = false;
        private float angle = 0f;

        private final Runnable drawRunner = new Runnable() {
            @Override
            public void run() {
                drawFrame();
                if (visible) {
                    handler.postDelayed(this, 33L);
                }
            }
        };

        @Override
        public void onVisibilityChanged(boolean visible) {
            this.visible = visible;
            if (visible) {
                handler.post(drawRunner);
            } else {
                handler.removeCallbacks(drawRunner);
            }
        }

        @Override
        public void onTouchEvent(MotionEvent event) {
            if (event != null && event.getAction() == MotionEvent.ACTION_DOWN) {
                Intent i = new Intent(MeeraWallpaperService.this, MeeraForegroundService.class)
                        .setAction("com.getmeera.android.ASSIST_WAKE");
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) startForegroundService(i);
                else startService(i);
            }
            super.onTouchEvent(event);
        }

        private void drawFrame() {
            SurfaceHolder holder = getSurfaceHolder();
            Canvas canvas = null;
            try {
                canvas = holder.lockCanvas();
                if (canvas != null) {
                    canvas.drawColor(Color.parseColor("#06070E"));
                    float cx = canvas.getWidth() / 2f;
                    float cy = canvas.getHeight() / 2f;
                    boolean speaking = MeeraForegroundService.isSpeaking;
                    angle += speaking ? 0.12f : 0.035f;
                    float wave = speaking ? 38f : 14f;

                    for (int i = 0; i < 42; i++) {
                        double rad = 110 + Math.sin(angle + i) * wave;
                        float x = (float) (cx + Math.cos(i * 0.3 + angle) * rad);
                        float y = (float) (cy + Math.sin(i * 0.5 + angle) * rad);
                        paint.setColor(speaking ? Color.parseColor("#EC4899") : Color.parseColor("#38BDF8"));
                        canvas.drawCircle(x, y, 6.5f, paint);
                    }
                }
            } catch (Throwable ignored) {
            } finally {
                if (canvas != null) {
                    try { holder.unlockCanvasAndPost(canvas); } catch (Throwable ignored) {}
                }
            }
        }

        @Override
        public void onDestroy() {
            handler.removeCallbacks(drawRunner);
            super.onDestroy();
        }
    }
}
