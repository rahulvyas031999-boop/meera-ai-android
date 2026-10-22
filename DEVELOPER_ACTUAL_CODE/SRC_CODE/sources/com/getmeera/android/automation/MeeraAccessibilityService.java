package com.getmeera.android.automation;

import android.accessibilityservice.AccessibilityService;
import android.accessibilityservice.GestureDescription;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Path;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityWindowInfo;
import defpackage.AbstractC1476Xb;
import defpackage.AbstractC3088iA1;
import defpackage.AbstractC3608lA1;
import defpackage.AbstractC3612lC;
import defpackage.AbstractC4082nv;
import defpackage.AbstractC4256ov;
import defpackage.AbstractC4430pv;
import defpackage.C0349Fj;
import defpackage.C1288Uc0;
import defpackage.C1373Vj0;
import defpackage.C1437Wj0;
import defpackage.C1565Yj0;
import defpackage.C1629Zj0;
import defpackage.C1695a91;
import defpackage.C1907bM0;
import defpackage.C2230dE0;
import defpackage.C3593l51;
import defpackage.C3987nL;
import defpackage.C4288p50;
import defpackage.C4586qp;
import defpackage.C4933sp;
import defpackage.DU;
import defpackage.E61;
import defpackage.ER0;
import defpackage.JO0;
import defpackage.LE1;
import defpackage.LV;
import defpackage.Lz1;
import defpackage.M61;
import defpackage.O4;
import defpackage.RL0;
import defpackage.WL0;
import defpackage.ZL0;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ExecutorService;
import java.util.regex.Pattern;
import kotlin.Metadata;

/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/getmeera/android/automation/MeeraAccessibilityService;", "Landroid/accessibilityservice/AccessibilityService;", "<init>", "()V", "Vj0", "app_release"}, k = 1, mv = {1, 9, 0})
public final class MeeraAccessibilityService extends AccessibilityService {
    public static volatile MeeraAccessibilityService Q;
    public static volatile String R;
    public static final CopyOnWriteArrayList S = new CopyOnWriteArrayList();
    public final C1695a91 N = new C1695a91(LV.m0);
    public final C1565Yj0 O = new C1565Yj0();
    public volatile boolean P;

    public static final void C(ZL0 zl0, StringBuilder sb, AccessibilityNodeInfo accessibilityNodeInfo) {
        String string;
        String string2;
        if (accessibilityNodeInfo != null && zl0.N <= 400) {
            CharSequence text = accessibilityNodeInfo.getText();
            String string3 = null;
            String string4 = (text == null || (string2 = text.toString()) == null) ? null : E61.q0(string2).toString();
            if (string4 == null) {
                string4 = "";
            }
            CharSequence contentDescription = accessibilityNodeInfo.getContentDescription();
            if (contentDescription != null && (string = contentDescription.toString()) != null) {
                string3 = E61.q0(string).toString();
            }
            String str = string3 != null ? string3 : "";
            if (string4.length() > 0 || str.length() > 0) {
                Rect rect = new Rect();
                accessibilityNodeInfo.getBoundsInScreen(rect);
                sb.append(string4);
                sb.append('|');
                sb.append(str);
                sb.append('|');
                sb.append(rect.left);
                sb.append(',');
                sb.append(rect.top);
                sb.append(';');
                zl0.N++;
            }
            int childCount = accessibilityNodeInfo.getChildCount();
            for (int i = 0; i < childCount; i++) {
                C(zl0, sb, accessibilityNodeInfo.getChild(i));
            }
        }
    }

    public static Object D(MeeraAccessibilityService meeraAccessibilityService, AbstractC3612lC abstractC3612lC) {
        meeraAccessibilityService.getClass();
        if (Build.VERSION.SDK_INT < 30) {
            return null;
        }
        C4586qp c4586qp = new C4586qp(1, AbstractC3608lA1.b(abstractC3612lC));
        c4586qp.w();
        try {
            meeraAccessibilityService.takeScreenshot(0, (ExecutorService) meeraAccessibilityService.N.getValue(), new C1629Zj0(c4586qp, 70));
        } catch (Exception unused) {
            if (c4586qp.c()) {
                c4586qp.k(null);
            }
        }
        return c4586qp.v();
    }

    public static boolean F(AccessibilityNodeInfo accessibilityNodeInfo, String str) {
        if (accessibilityNodeInfo == null) {
            return false;
        }
        Bundle bundle = new Bundle();
        bundle.putCharSequence("ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE", str);
        accessibilityNodeInfo.performAction(1);
        return accessibilityNodeInfo.performAction(2097152, bundle);
    }

    public static boolean L(String str, String str2) {
        int i;
        String string = E61.q0(Pattern.compile("\\s+").matcher(str).replaceAll(" ")).toString();
        Locale locale = Locale.ROOT;
        String lowerCase = string.toLowerCase(locale);
        String lowerCase2 = E61.q0(Pattern.compile("\\s+").matcher(str2).replaceAll(" ")).toString().toLowerCase(locale);
        if (lowerCase2.length() == 0 || lowerCase.equals(lowerCase2) || E61.C(lowerCase, lowerCase2, false)) {
            return true;
        }
        if (lowerCase.length() < ((double) lowerCase2.length()) * 0.9d) {
            return false;
        }
        int iMin = Math.min(lowerCase.length(), lowerCase2.length());
        ArrayList<C2230dE0> arrayList = new ArrayList(iMin);
        for (int i2 = 0; i2 < iMin; i2++) {
            arrayList.add(new C2230dE0(Character.valueOf(lowerCase.charAt(i2)), Character.valueOf(lowerCase2.charAt(i2))));
        }
        if (arrayList.isEmpty()) {
            i = 0;
        } else {
            i = 0;
            for (C2230dE0 c2230dE0 : arrayList) {
                if (((Character) c2230dE0.N).charValue() == ((Character) c2230dE0.O).charValue() && (i = i + 1) < 0) {
                    AbstractC4256ov.n();
                    throw null;
                }
            }
        }
        return ((double) i) >= ((double) lowerCase2.length()) * 0.9d;
    }

    public static Rect b(AccessibilityNodeInfo accessibilityNodeInfo) {
        if (accessibilityNodeInfo == null) {
            return null;
        }
        Rect rect = new Rect();
        accessibilityNodeInfo.getBoundsInScreen(rect);
        return rect;
    }

    public static C0349Fj c(AccessibilityNodeInfo accessibilityNodeInfo) {
        if (accessibilityNodeInfo == null) {
            return null;
        }
        Rect rect = new Rect();
        accessibilityNodeInfo.getBoundsInScreen(rect);
        if (rect.width() <= 0 || rect.height() <= 0) {
            return null;
        }
        return new C0349Fj(rect.left, rect.top, rect.right, rect.bottom);
    }

    public static final void h(DU du, ArrayList arrayList, AccessibilityNodeInfo accessibilityNodeInfo) {
        if (accessibilityNodeInfo == null) {
            return;
        }
        if (((Boolean) du.l(accessibilityNodeInfo)).booleanValue()) {
            arrayList.add(accessibilityNodeInfo);
        }
        int childCount = accessibilityNodeInfo.getChildCount();
        for (int i = 0; i < childCount; i++) {
            h(du, arrayList, accessibilityNodeInfo.getChild(i));
        }
    }

    public static final void j(StringBuilder sb, AccessibilityNodeInfo accessibilityNodeInfo) {
        CharSequence contentDescription;
        String string;
        String string2;
        String string3;
        String string4;
        if (accessibilityNodeInfo == null) {
            return;
        }
        CharSequence text = accessibilityNodeInfo.getText();
        if (text != null && (string3 = text.toString()) != null && (string4 = E61.q0(string3).toString()) != null) {
            if (string4.length() <= 0) {
                string4 = null;
            }
            if (string4 != null) {
                sb.append(string4);
                sb.append('\n');
            }
        }
        CharSequence text2 = accessibilityNodeInfo.getText();
        if ((text2 == null || text2.length() == 0) && (contentDescription = accessibilityNodeInfo.getContentDescription()) != null && (string = contentDescription.toString()) != null && (string2 = E61.q0(string).toString()) != null) {
            String str = string2.length() > 0 ? string2 : null;
            if (str != null) {
                sb.append(str);
                sb.append('\n');
            }
        }
        int childCount = accessibilityNodeInfo.getChildCount();
        for (int i = 0; i < childCount; i++) {
            j(sb, accessibilityNodeInfo.getChild(i));
        }
    }

    public static final void p(C1907bM0 c1907bM0, String str, C1907bM0 c1907bM02, AccessibilityNodeInfo accessibilityNodeInfo) {
        String string;
        if (accessibilityNodeInfo != null && c1907bM0.N == null) {
            CharSequence contentDescription = accessibilityNodeInfo.getContentDescription();
            String string2 = (contentDescription == null || (string = contentDescription.toString()) == null) ? null : E61.q0(string).toString();
            if (string2 != null) {
                if (string2.equalsIgnoreCase(str)) {
                    c1907bM0.N = accessibilityNodeInfo;
                    return;
                } else if (c1907bM02.N == null && E61.C(string2, str, true)) {
                    c1907bM02.N = accessibilityNodeInfo;
                }
            }
            int childCount = accessibilityNodeInfo.getChildCount();
            for (int i = 0; i < childCount; i++) {
                p(c1907bM0, str, c1907bM02, accessibilityNodeInfo.getChild(i));
            }
        }
    }

    public static String t(AccessibilityNodeInfo accessibilityNodeInfo) {
        String viewIdResourceName;
        String string;
        if (accessibilityNodeInfo == null || (viewIdResourceName = accessibilityNodeInfo.getViewIdResourceName()) == null || (string = E61.q0(E61.i0(viewIdResourceName, '/', viewIdResourceName)).toString()) == null || string.length() <= 0 || string.equals("0")) {
            return null;
        }
        return string;
    }

    public static String w(AccessibilityNodeInfo accessibilityNodeInfo) {
        String string;
        String string2;
        String string3;
        String string4;
        if (accessibilityNodeInfo == null) {
            return "(no label)";
        }
        CharSequence text = accessibilityNodeInfo.getText();
        String str = null;
        if (text != null && (string3 = text.toString()) != null && (string4 = E61.q0(string3).toString()) != null) {
            if (string4.length() == 0) {
                string4 = null;
            }
            if (string4 != null) {
                return string4;
            }
        }
        CharSequence contentDescription = accessibilityNodeInfo.getContentDescription();
        if (contentDescription != null && (string = contentDescription.toString()) != null && (string2 = E61.q0(string).toString()) != null && string2.length() != 0) {
            str = string2;
        }
        return str == null ? "(no label)" : str;
    }

    public static String x(AccessibilityNodeInfo accessibilityNodeInfo) {
        boolean zRefresh;
        String string;
        String string2;
        if (accessibilityNodeInfo == null) {
            return null;
        }
        try {
            zRefresh = accessibilityNodeInfo.refresh();
        } catch (Exception unused) {
            zRefresh = false;
        }
        if (!zRefresh) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(accessibilityNodeInfo.isChecked());
        sb.append('|');
        sb.append(accessibilityNodeInfo.isSelected());
        sb.append('|');
        sb.append(accessibilityNodeInfo.isFocused());
        sb.append('|');
        sb.append(accessibilityNodeInfo.isEnabled());
        sb.append('|');
        CharSequence text = accessibilityNodeInfo.getText();
        if (text == null || (string2 = text.toString()) == null || (string = E61.q0(string2).toString()) == null) {
            string = "-";
        }
        sb.append(string);
        return sb.toString();
    }

    public final C0349Fj A() {
        DisplayMetrics displayMetrics = getResources().getDisplayMetrics();
        return new C0349Fj(0, 0, displayMetrics.widthPixels, displayMetrics.heightPixels);
    }

    public final String B() {
        StringBuilder sb = new StringBuilder();
        C(new ZL0(), sb, getRootInActiveWindow());
        return sb.toString();
    }

    public final boolean E(boolean z, boolean z2) {
        Object obj;
        Iterator it = g(C1288Uc0.q0).iterator();
        if (it.hasNext()) {
            Object next = it.next();
            if (it.hasNext()) {
                AccessibilityNodeInfo accessibilityNodeInfo = (AccessibilityNodeInfo) next;
                Rect rectB = b(accessibilityNodeInfo);
                int iHeight = rectB != null ? rectB.height() : 0;
                Rect rectB2 = b(accessibilityNodeInfo);
                int iWidth = iHeight * (rectB2 != null ? rectB2.width() : 0);
                do {
                    Object next2 = it.next();
                    AccessibilityNodeInfo accessibilityNodeInfo2 = (AccessibilityNodeInfo) next2;
                    Rect rectB3 = b(accessibilityNodeInfo2);
                    int iHeight2 = rectB3 != null ? rectB3.height() : 0;
                    Rect rectB4 = b(accessibilityNodeInfo2);
                    int iWidth2 = iHeight2 * (rectB4 != null ? rectB4.width() : 0);
                    if (iWidth < iWidth2) {
                        next = next2;
                        iWidth = iWidth2;
                    }
                } while (it.hasNext());
            }
            obj = next;
        } else {
            obj = null;
        }
        AccessibilityNodeInfo accessibilityNodeInfo3 = (AccessibilityNodeInfo) obj;
        if (accessibilityNodeInfo3 == null) {
            return false;
        }
        int i = 4096;
        if ((z2 || !z) && ((!z2 && !z) || !z2 || !z)) {
            i = 8192;
        }
        return accessibilityNodeInfo3.performAction(i);
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x005c  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x008c  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00ac  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:26:0x005c -> B:32:0x007d). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:30:0x0073 -> B:31:0x0078). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public final java.lang.Object G(android.view.accessibility.AccessibilityNodeInfo r11, java.lang.String r12, defpackage.InterfaceC3438kC r13) throws java.lang.Throwable {
        /*
            r10 = this;
            boolean r0 = r13 instanceof defpackage.C1966bk0
            if (r0 == 0) goto L13
            r0 = r13
            bk0 r0 = (defpackage.C1966bk0) r0
            int r1 = r0.X
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.X = r1
            goto L18
        L13:
            bk0 r0 = new bk0
            r0.<init>(r10, r13)
        L18:
            java.lang.Object r13 = r0.V
            aD r1 = defpackage.EnumC1705aD.N
            int r2 = r0.X
            r3 = 2
            r4 = 1
            if (r2 == 0) goto L41
            if (r2 == r4) goto L33
            if (r2 != r3) goto L2b
            defpackage.YK1.b(r13)
            goto La9
        L2b:
            java.lang.IllegalStateException r11 = new java.lang.IllegalStateException
            java.lang.String r12 = "call to 'resume' before 'invoke' with coroutine"
            r11.<init>(r12)
            throw r11
        L33:
            int r11 = r0.U
            int r12 = r0.T
            java.lang.String r2 = r0.S
            android.view.accessibility.AccessibilityNodeInfo r5 = r0.R
            com.getmeera.android.automation.MeeraAccessibilityService r6 = r0.Q
            defpackage.YK1.b(r13)
            goto L78
        L41:
            defpackage.YK1.b(r13)
            if (r11 != 0) goto L49
            java.lang.Boolean r11 = java.lang.Boolean.FALSE
            return r11
        L49:
            boolean r13 = F(r11, r12)
            if (r13 != 0) goto L52
            java.lang.Boolean r11 = java.lang.Boolean.FALSE
            return r11
        L52:
            r13 = 4
            r2 = 0
            r6 = r10
            r9 = r12
            r12 = r11
            r11 = r2
            r2 = r0
            r0 = r9
        L5a:
            if (r11 >= r13) goto Lac
            if (r11 <= 0) goto L7d
            r2.Q = r6
            r2.R = r12
            r2.S = r0
            r2.T = r13
            r2.U = r11
            r2.X = r4
            r7 = 150(0x96, double:7.4E-322)
            java.lang.Object r5 = defpackage.AbstractC5899yK1.a(r7, r2)
            if (r5 != r1) goto L73
            return r1
        L73:
            r5 = r12
            r12 = r13
            r9 = r2
            r2 = r0
            r0 = r9
        L78:
            r13 = r12
            r12 = r5
            r9 = r2
            r2 = r0
            r0 = r9
        L7d:
            r12.refresh()
            java.lang.CharSequence r5 = r12.getText()
            r7 = 0
            if (r5 == 0) goto L8c
            java.lang.String r5 = r5.toString()
            goto L8d
        L8c:
            r5 = r7
        L8d:
            if (r5 != 0) goto L91
            java.lang.String r5 = ""
        L91:
            r6.getClass()
            boolean r5 = L(r5, r0)
            if (r5 == 0) goto Laa
            r2.Q = r7
            r2.R = r7
            r2.S = r7
            r2.X = r3
            java.lang.Object r13 = r6.s(r12, r0, r2)
            if (r13 != r1) goto La9
            return r1
        La9:
            return r13
        Laa:
            int r11 = r11 + r4
            goto L5a
        Lac:
            java.lang.Boolean r11 = java.lang.Boolean.FALSE
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getmeera.android.automation.MeeraAccessibilityService.G(android.view.accessibility.AccessibilityNodeInfo, java.lang.String, kC):java.lang.Object");
    }

    public final boolean H(float f, float f2, float f3, float f4, long j) {
        Path path = new Path();
        path.moveTo(f, f2);
        path.lineTo(f3, f4);
        return dispatchGesture(new GestureDescription.Builder().addStroke(new GestureDescription.StrokeDescription(path, 0L, j)).build(), null, null);
    }

    public final boolean I(float f, float f2) {
        Path path = new Path();
        path.moveTo(f, f2);
        return dispatchGesture(new GestureDescription.Builder().addStroke(new GestureDescription.StrokeDescription(path, 0L, 60L)).build(), null, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:26:0x0077 -> B:28:0x007a). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public final java.lang.Object J(android.view.accessibility.AccessibilityNodeInfo r9, long r10, defpackage.InterfaceC3438kC r12) throws java.lang.Throwable {
        /*
            r8 = this;
            boolean r0 = r12 instanceof defpackage.C2139ck0
            if (r0 == 0) goto L13
            r0 = r12
            ck0 r0 = (defpackage.C2139ck0) r0
            int r1 = r0.X
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.X = r1
            goto L18
        L13:
            ck0 r0 = new ck0
            r0.<init>(r8, r12)
        L18:
            java.lang.Object r12 = r0.V
            aD r1 = defpackage.EnumC1705aD.N
            int r2 = r0.X
            r3 = 1
            if (r2 == 0) goto L3c
            if (r2 != r3) goto L34
            long r9 = r0.U
            java.lang.String r11 = r0.T
            java.lang.String r2 = r0.S
            android.view.accessibility.AccessibilityNodeInfo r4 = r0.R
            com.getmeera.android.automation.MeeraAccessibilityService r5 = r0.Q
            defpackage.YK1.b(r12)
            r12 = r2
            r2 = r11
            r11 = r4
            goto L7a
        L34:
            java.lang.IllegalStateException r9 = new java.lang.IllegalStateException
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            r9.<init>(r10)
            throw r9
        L3c:
            defpackage.YK1.b(r12)
            if (r9 != 0) goto L44
            java.lang.Boolean r9 = java.lang.Boolean.FALSE
            return r9
        L44:
            java.lang.String r12 = r8.B()
            java.lang.String r2 = x(r9)
            boolean r4 = r8.f(r9)
            if (r4 != 0) goto L55
            java.lang.Boolean r9 = java.lang.Boolean.FALSE
            return r9
        L55:
            long r4 = java.lang.System.currentTimeMillis()
            long r4 = r4 + r10
            r11 = r9
            r9 = r4
            r5 = r8
        L5d:
            long r6 = java.lang.System.currentTimeMillis()
            int r4 = (r6 > r9 ? 1 : (r6 == r9 ? 0 : -1))
            if (r4 >= 0) goto L96
            r0.Q = r5
            r0.R = r11
            r0.S = r12
            r0.T = r2
            r0.U = r9
            r0.X = r3
            r6 = 120(0x78, double:5.93E-322)
            java.lang.Object r4 = defpackage.AbstractC5899yK1.a(r6, r0)
            if (r4 != r1) goto L7a
            return r1
        L7a:
            java.lang.String r4 = r5.B()
            boolean r4 = r4.equals(r12)
            if (r4 != 0) goto L87
            java.lang.Boolean r9 = java.lang.Boolean.TRUE
            return r9
        L87:
            java.lang.String r4 = x(r11)
            if (r4 == 0) goto L93
            boolean r4 = r4.equals(r2)
            if (r4 != 0) goto L5d
        L93:
            java.lang.Boolean r9 = java.lang.Boolean.TRUE
            return r9
        L96:
            java.lang.Boolean r9 = java.lang.Boolean.FALSE
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getmeera.android.automation.MeeraAccessibilityService.J(android.view.accessibility.AccessibilityNodeInfo, long, kC):java.lang.Object");
    }

    public final boolean K(AccessibilityNodeInfo accessibilityNodeInfo) {
        boolean zRefresh;
        C0349Fj c0349FjC;
        if (accessibilityNodeInfo == null) {
            return false;
        }
        try {
            zRefresh = accessibilityNodeInfo.refresh();
        } catch (Exception unused) {
            zRefresh = false;
        }
        if (!zRefresh || (c0349FjC = c(accessibilityNodeInfo)) == null) {
            return false;
        }
        if (c0349FjC.a(A()).i()) {
            return false;
        }
        return I(r3.d(), r3.e());
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0139 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x013a  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0144  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x014b  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0174  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0179  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x017c  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0187  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x019d  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x01a1  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Type inference failed for: r13v0 */
    /* JADX WARN: Type inference failed for: r13v1, types: [Rg1, android.view.accessibility.AccessibilityNodeInfo, com.getmeera.android.automation.MeeraAccessibilityService, java.lang.String, java.lang.StringBuilder] */
    /* JADX WARN: Type inference failed for: r13v11 */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:53:0x013a -> B:54:0x013d). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:59:0x0165 -> B:63:0x016b). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:61:0x0168 -> B:62:0x0169). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public final java.lang.Object M(android.view.accessibility.AccessibilityNodeInfo r17, java.lang.String r18, defpackage.EnumC1109Rg1 r19, defpackage.InterfaceC3438kC r20) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 420
            To view this dump change 'Code comments level' option to 'DEBUG'
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getmeera.android.automation.MeeraAccessibilityService.M(android.view.accessibility.AccessibilityNodeInfo, java.lang.String, Rg1, kC):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public final java.lang.Object N(long r7, long r9, defpackage.CU r11, defpackage.InterfaceC3438kC r12) {
        /*
            r6 = this;
            boolean r0 = r12 instanceof defpackage.C2486ek0
            if (r0 == 0) goto L13
            r0 = r12
            ek0 r0 = (defpackage.C2486ek0) r0
            int r1 = r0.V
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.V = r1
            goto L18
        L13:
            ek0 r0 = new ek0
            r0.<init>(r6, r12)
        L18:
            java.lang.Object r12 = r0.T
            aD r1 = defpackage.EnumC1705aD.N
            int r2 = r0.V
            r3 = 1
            if (r2 == 0) goto L35
            if (r2 != r3) goto L2d
            long r7 = r0.R
            long r9 = r0.Q
            CU r11 = r0.S
            defpackage.YK1.b(r12)
            goto L3e
        L2d:
            java.lang.IllegalStateException r7 = new java.lang.IllegalStateException
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            r7.<init>(r8)
            throw r7
        L35:
            defpackage.YK1.b(r12)
            long r4 = java.lang.System.currentTimeMillis()
            long r4 = r4 + r7
            r7 = r4
        L3e:
            long r4 = java.lang.System.currentTimeMillis()
            int r12 = (r4 > r7 ? 1 : (r4 == r7 ? 0 : -1))
            if (r12 >= 0) goto L5c
            java.lang.Object r12 = r11.a()
            if (r12 == 0) goto L4d
            return r12
        L4d:
            r0.S = r11
            r0.Q = r9
            r0.R = r7
            r0.V = r3
            java.lang.Object r12 = defpackage.AbstractC5899yK1.a(r9, r0)
            if (r12 != r1) goto L3e
            return r1
        L5c:
            r7 = 0
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getmeera.android.automation.MeeraAccessibilityService.N(long, long, CU, kC):java.lang.Object");
    }

    public final ArrayList a() {
        C4933sp c4933spD;
        ArrayList<AccessibilityNodeInfo> arrayListG = g(C1288Uc0.o0);
        ArrayList arrayList = new ArrayList();
        for (AccessibilityNodeInfo accessibilityNodeInfo : arrayListG) {
            C1373Vj0 c1373Vj0 = null;
            if (u(accessibilityNodeInfo) && (c4933spD = d(accessibilityNodeInfo, 0)) != null) {
                c1373Vj0 = new C1373Vj0(accessibilityNodeInfo, c4933spD);
            }
            if (c1373Vj0 != null) {
                arrayList.add(c1373Vj0);
            }
        }
        return arrayList;
    }

    public final C4933sp d(AccessibilityNodeInfo accessibilityNodeInfo, int i) {
        C0349Fj c0349FjC = c(accessibilityNodeInfo);
        if (c0349FjC == null) {
            return null;
        }
        CharSequence text = accessibilityNodeInfo.getText();
        String string = text != null ? text.toString() : null;
        CharSequence contentDescription = accessibilityNodeInfo.getContentDescription();
        return new C4933sp(i, string, contentDescription != null ? contentDescription.toString() : null, t(accessibilityNodeInfo), c0349FjC.a(A()), accessibilityNodeInfo.isClickable(), accessibilityNodeInfo.isEditable(), accessibilityNodeInfo.isEnabled(), accessibilityNodeInfo.isCheckable(), accessibilityNodeInfo.isChecked());
    }

    public final boolean e(AccessibilityNodeInfo accessibilityNodeInfo) {
        if (accessibilityNodeInfo == null) {
            return false;
        }
        if (accessibilityNodeInfo.isClickable() && accessibilityNodeInfo.isEnabled()) {
            return accessibilityNodeInfo.performAction(16);
        }
        C0349Fj c0349FjC = c(accessibilityNodeInfo);
        C0349Fj c0349FjA = A();
        int i = 0;
        for (AccessibilityNodeInfo parent = accessibilityNodeInfo.getParent(); parent != null && i < 5; parent = parent.getParent()) {
            i++;
            if (parent.isClickable() && parent.isEnabled()) {
                C0349Fj c0349FjC2 = c(parent);
                if (c0349FjC == null || c0349FjC2 == null || (!c0349FjC2.i() && c0349FjC2.b(c0349FjC.d(), c0349FjC.e()) && (c0349FjA.c() <= 0 || (c0349FjC2.c() <= c0349FjA.c() * 0.5d && (c0349FjA.f() <= 0 || c0349FjC2.f() <= ((double) c0349FjA.f()) * 0.6d))))) {
                    return parent.performAction(16);
                }
                return false;
            }
        }
        return false;
    }

    public final boolean f(AccessibilityNodeInfo accessibilityNodeInfo) {
        if (e(accessibilityNodeInfo)) {
            return true;
        }
        return K(accessibilityNodeInfo);
    }

    public final ArrayList g(DU du) {
        ArrayList arrayList = new ArrayList();
        h(du, arrayList, getRootInActiveWindow());
        return arrayList;
    }

    public final String i() {
        StringBuilder sb = new StringBuilder();
        j(sb, getRootInActiveWindow());
        return E61.q0(sb.toString()).toString();
    }

    public final String k() {
        String string;
        Object next;
        CharSequence packageName;
        Object next2;
        try {
            List<AccessibilityWindowInfo> windows = getWindows();
            ArrayList arrayList = new ArrayList();
            for (Object obj : windows) {
                if (((AccessibilityWindowInfo) obj).getType() == 1) {
                    arrayList.add(obj);
                }
            }
            Iterator it = arrayList.iterator();
            while (true) {
                string = null;
                if (!it.hasNext()) {
                    next = null;
                    break;
                }
                next = it.next();
                if (((AccessibilityWindowInfo) next).isFocused()) {
                    break;
                }
            }
            AccessibilityWindowInfo accessibilityWindowInfo = (AccessibilityWindowInfo) next;
            if (accessibilityWindowInfo == null) {
                Iterator it2 = arrayList.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        next2 = null;
                        break;
                    }
                    next2 = it2.next();
                    if (((AccessibilityWindowInfo) next2).isActive()) {
                        break;
                    }
                }
                accessibilityWindowInfo = (AccessibilityWindowInfo) next2;
            }
            if (accessibilityWindowInfo != null) {
                try {
                    AccessibilityNodeInfo root = accessibilityWindowInfo.getRoot();
                    if (root != null && (packageName = root.getPackageName()) != null) {
                        string = packageName.toString();
                    }
                } catch (Exception unused) {
                }
            }
            if (string != null && !M61.w(string) && !E61.C(string, "inputmethod", true)) {
                return string;
            }
            return R;
        } catch (Exception unused2) {
            return R;
        }
    }

    public final boolean l(List list, long j, DU du) {
        Object jo0;
        if (list.size() < 2) {
            return false;
        }
        Path path = new Path();
        path.moveTo(((Number) ((C2230dE0) AbstractC4082nv.E(list)).N).floatValue(), ((Number) ((C2230dE0) AbstractC4082nv.E(list)).O).floatValue());
        for (C2230dE0 c2230dE0 : AbstractC4082nv.z(list, 1)) {
            path.lineTo(((Number) c2230dE0.N).floatValue(), ((Number) c2230dE0.O).floatValue());
        }
        try {
            jo0 = Boolean.valueOf(dispatchGesture(new GestureDescription.Builder().addStroke(new GestureDescription.StrokeDescription(path, 0L, j)).build(), new C1437Wj0(du), null));
        } catch (Throwable th) {
            jo0 = new JO0(th);
        }
        Object obj = Boolean.FALSE;
        if (jo0 instanceof JO0) {
            jo0 = obj;
        }
        return ((Boolean) jo0).booleanValue();
    }

    public final List m(String str) {
        List<AccessibilityNodeInfo> listFindAccessibilityNodeInfosByText;
        AccessibilityNodeInfo rootInActiveWindow = getRootInActiveWindow();
        return (rootInActiveWindow == null || (listFindAccessibilityNodeInfosByText = rootInActiveWindow.findAccessibilityNodeInfosByText(str)) == null) ? C3987nL.N : AbstractC4082nv.g0(listFindAccessibilityNodeInfosByText);
    }

    public final List n(String str) {
        List<AccessibilityNodeInfo> listFindAccessibilityNodeInfosByViewId;
        AccessibilityNodeInfo rootInActiveWindow = getRootInActiveWindow();
        return (rootInActiveWindow == null || (listFindAccessibilityNodeInfosByViewId = rootInActiveWindow.findAccessibilityNodeInfosByViewId(str)) == null) ? C3987nL.N : AbstractC4082nv.g0(listFindAccessibilityNodeInfosByViewId);
    }

    public final AccessibilityNodeInfo o(String str) {
        C1907bM0 c1907bM0 = new C1907bM0();
        C1907bM0 c1907bM02 = new C1907bM0();
        p(c1907bM0, str, c1907bM02, getRootInActiveWindow());
        AccessibilityNodeInfo accessibilityNodeInfo = (AccessibilityNodeInfo) c1907bM0.N;
        return accessibilityNodeInfo == null ? (AccessibilityNodeInfo) c1907bM02.N : accessibilityNodeInfo;
    }

    @Override // android.accessibilityservice.AccessibilityService
    public final void onAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        CharSequence packageName;
        String string;
        if (accessibilityEvent == null || accessibilityEvent.getEventType() != 32 || (packageName = accessibilityEvent.getPackageName()) == null || (string = packageName.toString()) == null) {
            return;
        }
        if (!(!M61.w(string))) {
            string = null;
        }
        if (string != null) {
            boolean z = string.equals(getPackageName()) || string.equals("com.android.systemui") || E61.C(string, "inputmethod", true) || M61.u(string, ".ime", false) || E61.C(string, ".ime.", false);
            if (!z) {
                boolean z2 = !AbstractC3088iA1.b(R, string);
                R = string;
                if (z2) {
                    Iterator it = S.iterator();
                    while (it.hasNext()) {
                        try {
                            ((DU) it.next()).l(string);
                        } catch (Throwable unused) {
                        }
                    }
                }
            }
            try {
                String str = AbstractC1476Xb.a;
                AbstractC1476Xb.a(this, string, z && !string.equals(getPackageName()));
            } catch (Throwable unused2) {
            }
            if (string.equals("com.instagram.android")) {
                WL0 wl0 = WL0.a;
                C3593l51 c3593l51 = WL0.c;
                if (c3593l51 == null || !c3593l51.c()) {
                    Context applicationContext = getApplicationContext();
                    wl0.j(applicationContext);
                    if (WL0.f()) {
                        LE1.g(WL0.b, null, 0, new RL0(applicationContext, null), 3);
                    }
                }
            }
        }
    }

    @Override // android.app.Service
    public final void onDestroy() {
        if (Q == this) {
            Q = null;
        }
        try {
            ((ExecutorService) this.N.getValue()).shutdown();
        } catch (Throwable unused) {
        }
        super.onDestroy();
    }

    @Override // android.accessibilityservice.AccessibilityService
    public final void onInterrupt() {
    }

    @Override // android.accessibilityservice.AccessibilityService
    public final void onServiceConnected() {
        super.onServiceConnected();
        Q = this;
        try {
            File file = O4.a;
            O4.b(getApplicationContext());
            O4.c("A11Y connected");
        } catch (Throwable unused) {
        }
        if (!this.P) {
            try {
                IntentFilter intentFilter = new IntentFilter("android.intent.action.SCREEN_OFF");
                if (Build.VERSION.SDK_INT >= 33) {
                    registerReceiver(this.O, intentFilter, 4);
                } else {
                    registerReceiver(this.O, intentFilter);
                }
                this.P = true;
            } catch (Throwable unused2) {
            }
        }
        WL0.a.j(this);
    }

    @Override // android.app.Service
    public final boolean onUnbind(Intent intent) {
        try {
            File file = O4.a;
            O4.b(getApplicationContext());
            O4.c("A11Y unbound");
        } catch (Throwable unused) {
        }
        if (this.P) {
            try {
                unregisterReceiver(this.O);
            } catch (Throwable unused2) {
            }
        }
        this.P = false;
        if (Q == this) {
            Q = null;
        }
        return super.onUnbind(intent);
    }

    public final AccessibilityNodeInfo q(String str) {
        List<AccessibilityNodeInfo> listFindAccessibilityNodeInfosByViewId;
        AccessibilityNodeInfo rootInActiveWindow = getRootInActiveWindow();
        if (rootInActiveWindow == null || (listFindAccessibilityNodeInfosByViewId = rootInActiveWindow.findAccessibilityNodeInfosByViewId(str)) == null) {
            return null;
        }
        return (AccessibilityNodeInfo) AbstractC4082nv.G(listFindAccessibilityNodeInfosByViewId);
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public final android.view.accessibility.AccessibilityNodeInfo r() {
        /*
            r7 = this;
            android.view.accessibility.AccessibilityNodeInfo r0 = r7.getRootInActiveWindow()
            r1 = 0
            if (r0 != 0) goto L8
            return r1
        L8:
            r2 = 1
            android.view.accessibility.AccessibilityNodeInfo r0 = r0.findFocus(r2)     // Catch: java.lang.Exception -> L20
            if (r0 == 0) goto L20
            boolean r2 = r0.isEditable()     // Catch: java.lang.Exception -> L20
            if (r2 == 0) goto L1c
            boolean r2 = r7.u(r0)     // Catch: java.lang.Exception -> L20
            if (r2 == 0) goto L1c
            goto L1d
        L1c:
            r0 = r1
        L1d:
            if (r0 == 0) goto L20
            return r0
        L20:
            Uc0 r0 = defpackage.C1288Uc0.p0
            java.util.ArrayList r0 = r7.g(r0)
            java.util.ArrayList r2 = new java.util.ArrayList
            r2.<init>()
            java.util.Iterator r3 = r0.iterator()
        L2f:
            boolean r4 = r3.hasNext()
            if (r4 == 0) goto L46
            java.lang.Object r4 = r3.next()
            r5 = r4
            android.view.accessibility.AccessibilityNodeInfo r5 = (android.view.accessibility.AccessibilityNodeInfo) r5
            boolean r5 = r7.u(r5)
            if (r5 == 0) goto L2f
            r2.add(r4)
            goto L2f
        L46:
            java.util.Iterator r3 = r2.iterator()
        L4a:
            boolean r4 = r3.hasNext()
            if (r4 == 0) goto L5e
            java.lang.Object r4 = r3.next()
            r5 = r4
            android.view.accessibility.AccessibilityNodeInfo r5 = (android.view.accessibility.AccessibilityNodeInfo) r5
            boolean r5 = r5.isFocused()
            if (r5 == 0) goto L4a
            goto L5f
        L5e:
            r4 = r1
        L5f:
            android.view.accessibility.AccessibilityNodeInfo r4 = (android.view.accessibility.AccessibilityNodeInfo) r4
            if (r4 == 0) goto L64
            return r4
        L64:
            java.util.Iterator r2 = r2.iterator()
            boolean r3 = r2.hasNext()
            if (r3 != 0) goto L6f
            goto La7
        L6f:
            java.lang.Object r1 = r2.next()
            boolean r3 = r2.hasNext()
            if (r3 != 0) goto L7a
            goto La7
        L7a:
            r3 = r1
            android.view.accessibility.AccessibilityNodeInfo r3 = (android.view.accessibility.AccessibilityNodeInfo) r3
            Fj r3 = c(r3)
            r4 = 0
            if (r3 == 0) goto L89
            int r3 = r3.e()
            goto L8a
        L89:
            r3 = r4
        L8a:
            java.lang.Object r5 = r2.next()
            r6 = r5
            android.view.accessibility.AccessibilityNodeInfo r6 = (android.view.accessibility.AccessibilityNodeInfo) r6
            Fj r6 = c(r6)
            if (r6 == 0) goto L9c
            int r6 = r6.e()
            goto L9d
        L9c:
            r6 = r4
        L9d:
            if (r3 >= r6) goto La1
            r1 = r5
            r3 = r6
        La1:
            boolean r5 = r2.hasNext()
            if (r5 != 0) goto L8a
        La7:
            android.view.accessibility.AccessibilityNodeInfo r1 = (android.view.accessibility.AccessibilityNodeInfo) r1
            if (r1 == 0) goto Lac
            return r1
        Lac:
            java.lang.Object r0 = defpackage.AbstractC4082nv.G(r0)
            android.view.accessibility.AccessibilityNodeInfo r0 = (android.view.accessibility.AccessibilityNodeInfo) r0
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getmeera.android.automation.MeeraAccessibilityService.r():android.view.accessibility.AccessibilityNodeInfo");
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00bf  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00c7  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00d1  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00d4  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00d6  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:36:0x009f -> B:40:0x00b6). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:38:0x00b3 -> B:40:0x00b6). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public final java.lang.Object s(android.view.accessibility.AccessibilityNodeInfo r13, java.lang.String r14, defpackage.InterfaceC3438kC r15) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 217
            To view this dump change 'Code comments level' option to 'DEBUG'
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getmeera.android.automation.MeeraAccessibilityService.s(android.view.accessibility.AccessibilityNodeInfo, java.lang.String, kC):java.lang.Object");
    }

    public final boolean u(AccessibilityNodeInfo accessibilityNodeInfo) {
        C0349Fj c0349FjC;
        if (accessibilityNodeInfo == null || !accessibilityNodeInfo.isVisibleToUser() || (c0349FjC = c(accessibilityNodeInfo)) == null) {
            return false;
        }
        return c0349FjC.h(A());
    }

    public final ArrayList v(String str) {
        ArrayList arrayListY = y(str, true);
        return true ^ arrayListY.isEmpty() ? arrayListY : y(str, false);
    }

    public final ArrayList y(String str, boolean z) {
        ArrayList arrayList = new ArrayList();
        for (AccessibilityNodeInfo accessibilityNodeInfo : g(new C4288p50(this, 1))) {
            if (!z || u(accessibilityNodeInfo)) {
                C4933sp c4933spD = d(accessibilityNodeInfo, arrayList.size());
                if (c4933spD != null) {
                    arrayList.add(new C1373Vj0(accessibilityNodeInfo, c4933spD));
                }
            }
        }
        ArrayList arrayList2 = new ArrayList(AbstractC4430pv.p(arrayList, 10));
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            arrayList2.add(((C1373Vj0) it.next()).b);
        }
        List listD = Lz1.d(str, arrayList2);
        ArrayList arrayList3 = new ArrayList();
        Iterator it2 = listD.iterator();
        while (it2.hasNext()) {
            C1373Vj0 c1373Vj0 = (C1373Vj0) AbstractC4082nv.H(((ER0) it2.next()).a.a, arrayList);
            if (c1373Vj0 != null) {
                arrayList3.add(c1373Vj0);
            }
        }
        return arrayList3;
    }

    public final String z() {
        CharSequence packageName;
        try {
            AccessibilityNodeInfo rootInActiveWindow = getRootInActiveWindow();
            if (rootInActiveWindow == null || (packageName = rootInActiveWindow.getPackageName()) == null) {
                return null;
            }
            return packageName.toString();
        } catch (Exception unused) {
            return null;
        }
    }
}
