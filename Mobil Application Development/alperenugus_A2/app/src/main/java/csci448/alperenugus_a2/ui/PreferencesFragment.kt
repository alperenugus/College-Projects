package csci448.alperenugus_a2.ui

import android.os.Bundle
import androidx.preference.Preference
import androidx.preference.PreferenceScreen
import csci448.alperenugus_a2.R

private val logTag: String = "448.PreferencesFragment"

class PreferencesFragment: androidx.preference.PreferenceFragmentCompat() {

    private var multiPlayer: Preference? = null
    private var difficultyLevel: Preference? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onCreatePreferences(savedInstanceState: Bundle?, rootKey: String?) {
        setPreferencesFromResource(R.xml.preferences, rootKey)

        val prefScreen: PreferenceScreen? = preferenceScreen

        multiPlayer = findPreference("numPlayerKey")
        difficultyLevel = findPreference("difficultyKey")

        multiPlayer?.setOnPreferenceChangeListener { preference, newValue ->

            if(newValue.toString() == "true") {
                prefScreen?.removePreference(difficultyLevel)
            }
            else{
                if(!difficultyLevel?.isShown!!) prefScreen?.addPreference(difficultyLevel)

            }

            true


        }

    }



}