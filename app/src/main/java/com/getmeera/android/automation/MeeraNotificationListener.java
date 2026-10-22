package com.getmeera.android.automation;

import android.app.Notification;
import android.app.PendingIntent;
import android.app.RemoteInput;
import android.content.Intent;
import android.os.Bundle;
import android.service.notification.NotificationListenerService;
import android.service.notification.StatusBarNotification;

public final class MeeraNotificationListener extends NotificationListenerService {
    public static volatile MeeraNotificationListener X;
    private Notification.Action latestReplyAction;
    private String latestSender = "";
    private String latestMessage = "";

    @Override
    public void onListenerConnected() {
        super.onListenerConnected();
        X = this;
    }

    @Override
    public void onNotificationPosted(StatusBarNotification sbn) {
        if (sbn == null) return;
        String pkg = sbn.getPackageName();
        if (pkg == null || (!pkg.contains("whatsapp") && !pkg.contains("messaging"))) return;

        Notification notif = sbn.getNotification();
        if (notif == null || notif.extras == null) return;

        CharSequence title = notif.extras.getCharSequence(Notification.EXTRA_TITLE);
        CharSequence text = notif.extras.getCharSequence(Notification.EXTRA_TEXT);
        if (title != null) latestSender = title.toString();
        if (text != null) latestMessage = text.toString();

        if (notif.actions != null) {
            for (Notification.Action act : notif.actions) {
                if (act.getRemoteInputs() != null && act.getRemoteInputs().length > 0) {
                    latestReplyAction = act;
                    break;
                }
            }
        }
    }

    public boolean replyToLatestNotification(String replyText) {
        if (latestReplyAction == null || latestReplyAction.actionIntent == null || replyText == null) {
            return false;
        }
        try {
            Intent localIntent = new Intent();
            Bundle localBundle = new Bundle();
            for (RemoteInput ri : latestReplyAction.getRemoteInputs()) {
                localBundle.putCharSequence(ri.getResultKey(), replyText);
            }
            RemoteInput.addResultsToIntent(latestReplyAction.getRemoteInputs(), localIntent, localBundle);
            latestReplyAction.actionIntent.send(this, 0, localIntent);
            return true;
        } catch (PendingIntent.CanceledException e) {
            return false;
        }
    }

    public String getLatestSummary() {
        if (latestSender.isEmpty() && latestMessage.isEmpty()) return "No recent WhatsApp messages";
        return latestSender + ": " + latestMessage;
    }
}
