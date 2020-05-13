package theinvestors.csci448.geolocatr

import android.content.Context
import androidx.core.content.edit
import androidx.preference.PreferenceManager

class LocatrPreferences(context: Context) {

    companion object {
        private const val PREFS_POLLING_KEY = "polling_key"
    }

    private val prefs = PreferenceManager.getDefaultSharedPreferences(context)

    var isPollingOn: Boolean
        get() = prefs.getBoolean(PREFS_POLLING_KEY, false)
        set(value) = prefs.edit {
            putBoolean(PREFS_POLLING_KEY, value)
            commit()
        }

}
