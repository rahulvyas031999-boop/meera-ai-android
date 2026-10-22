package com.meera.assistant

import android.content.Context
import android.content.SharedPreferences
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey

// API key aur persona encrypted storage me rehte hain.
object SecureStore {
    private fun prefs(ctx: Context): SharedPreferences {
        val master = MasterKey.Builder(ctx)
            .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
            .build()
        return EncryptedSharedPreferences.create(
            ctx,
            "meera_secure",
            master,
            EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
            EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
        )
    }

    fun getKey(ctx: Context): String? = prefs(ctx).getString("gemini_key", null)
    fun saveKey(ctx: Context, key: String) {
        prefs(ctx).edit().putString("gemini_key", key).apply()
    }

    fun getPersona(ctx: Context): String = prefs(ctx).getString("persona", "Meera") ?: "Meera"
    fun savePersona(ctx: Context, name: String) {
        prefs(ctx).edit().putString("persona", name).apply()
    }
}
