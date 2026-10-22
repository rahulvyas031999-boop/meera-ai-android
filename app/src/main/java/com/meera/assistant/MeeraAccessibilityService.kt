package com.meera.assistant

import android.accessibilityservice.AccessibilityService
import android.view.accessibility.AccessibilityEvent

// Abhi khaali hai. Baad me yahan screen padhna / tap karna jodenge.
class MeeraAccessibilityService : AccessibilityService() {
    override fun onAccessibilityEvent(event: AccessibilityEvent?) {}
    override fun onInterrupt() {}
}
