package com.getmeera.android.automation;

import android.accessibilityservice.AccessibilityService;
import android.accessibilityservice.GestureDescription;
import android.graphics.Path;
import android.graphics.Rect;
import android.os.Bundle;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;

public final class MeeraAccessibilityService extends AccessibilityService {
    public static volatile MeeraAccessibilityService Q;
    private boolean recordingMacro = false;
    private String currentMacroName = "default";
    private final List<String> macroSteps = new ArrayList<>();

    @Override
    protected void onServiceConnected() {
        super.onServiceConnected();
        Q = this;
    }

    @Override
    public void onAccessibilityEvent(AccessibilityEvent event) {
        if (recordingMacro && event != null && event.getEventType() == AccessibilityEvent.TYPE_VIEW_CLICKED) {
            CharSequence txt = event.getText() != null && !event.getText().isEmpty() ? event.getText().get(0) : event.getContentDescription();
            if (txt != null) {
                macroSteps.add("tap:" + txt);
            }
        }
    }

    @Override
    public void onInterrupt() {}

    public String readAllScreenText() {
        AccessibilityNodeInfo root = getRootInActiveWindow();
        if (root == null) return "";
        StringBuilder sb = new StringBuilder();
        collectTextRecursive(root, sb);
        return sb.toString().trim();
    }

    private void collectTextRecursive(AccessibilityNodeInfo node, StringBuilder sb) {
        if (node == null) return;
        CharSequence t = node.getText();
        CharSequence d = node.getContentDescription();
        if (t != null && t.length() > 0) {
            sb.append(t).append(" | ");
        } else if (d != null && d.length() > 0) {
            sb.append(d).append(" | ");
        }
        int count = node.getChildCount();
        for (int i = 0; i < count; i++) {
            collectTextRecursive(node.getChild(i), sb);
        }
    }

    public boolean tapTextOnScreen(String query) {
        if (query == null || query.trim().isEmpty()) return false;
        AccessibilityNodeInfo root = getRootInActiveWindow();
        if (root == null) return false;
        AccessibilityNodeInfo match = findNodeByTextRecursive(root, query.toLowerCase(Locale.ROOT).trim());
        if (match == null) return false;

        AccessibilityNodeInfo clickable = match;
        while (clickable != null && !clickable.isClickable()) {
            clickable = clickable.getParent();
        }
        if (clickable != null && clickable.performAction(AccessibilityNodeInfo.ACTION_CLICK)) {
            return true;
        }
        Rect bounds = new Rect();
        match.getBoundsInScreen(bounds);
        return tapCoordinates(bounds.centerX(), bounds.centerY());
    }

    private AccessibilityNodeInfo findNodeByTextRecursive(AccessibilityNodeInfo node, String queryLower) {
        if (node == null) return null;
        CharSequence t = node.getText();
        CharSequence d = node.getContentDescription();
        if (t != null && t.toString().toLowerCase(Locale.ROOT).contains(queryLower)) return node;
        if (d != null && d.toString().toLowerCase(Locale.ROOT).contains(queryLower)) return node;
        int count = node.getChildCount();
        for (int i = 0; i < count; i++) {
            AccessibilityNodeInfo found = findNodeByTextRecursive(node.getChild(i), queryLower);
            if (found != null) return found;
        }
        return null;
    }

    public boolean tapCoordinates(int x, int y) {
        Path clickPath = new Path();
        clickPath.moveTo(Math.max(1, x), Math.max(1, y));
        GestureDescription.Builder builder = new GestureDescription.Builder();
        builder.addStroke(new GestureDescription.StrokeDescription(clickPath, 0, 80));
        return dispatchGesture(builder.build(), null, null);
    }

    public boolean typeTextIntoFocusedField(String text) {
        AccessibilityNodeInfo root = getRootInActiveWindow();
        if (root == null) return false;
        AccessibilityNodeInfo target = root.findFocus(AccessibilityNodeInfo.FOCUS_INPUT);
        if (target == null) {
            target = findFirstEditableNode(root);
        }
        if (target == null) return false;
        Bundle args = new Bundle();
        args.putCharSequence(AccessibilityNodeInfo.ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE, text);
        return target.performAction(AccessibilityNodeInfo.ACTION_SET_TEXT, args);
    }

    private AccessibilityNodeInfo findFirstEditableNode(AccessibilityNodeInfo node) {
        if (node == null) return null;
        if (node.isEditable()) return node;
        int count = node.getChildCount();
        for (int i = 0; i < count; i++) {
            AccessibilityNodeInfo found = findFirstEditableNode(node.getChild(i));
            if (found != null) return found;
        }
        return null;
    }

    public boolean performBackAction() {
        return performGlobalAction(GLOBAL_ACTION_BACK);
    }

    public boolean waitForScreenText(String text, String mode, int timeoutSeconds) {
        long deadline = System.currentTimeMillis() + Math.max(1, timeoutSeconds) * 1000L;
        String q = text.toLowerCase(Locale.ROOT);
        boolean wantDisappear = "disappear".equalsIgnoreCase(mode);
        while (System.currentTimeMillis() < deadline) {
            String all = readAllScreenText().toLowerCase(Locale.ROOT);
            boolean present = all.contains(q);
            if ((wantDisappear && !present) || (!wantDisappear && present)) {
                return true;
            }
            try { Thread.sleep(350L); } catch (InterruptedException ignored) { break; }
        }
        return false;
    }

    public void startMacroRecording(String taskName) {
        currentMacroName = taskName != null ? taskName : "default";
        macroSteps.clear();
        recordingMacro = true;
    }

    public void saveMacroRecording(String taskName) {
        recordingMacro = false;
        String name = (taskName != null && !taskName.isEmpty()) ? taskName : currentMacroName;
        JSONArray arr = new JSONArray(macroSteps);
        getSharedPreferences("meera_macros", 0).edit().putString(name, arr.toString()).apply();
    }

    public void undoLastMacroStep() {
        if (!macroSteps.isEmpty()) {
            macroSteps.remove(macroSteps.size() - 1);
        }
    }
}
