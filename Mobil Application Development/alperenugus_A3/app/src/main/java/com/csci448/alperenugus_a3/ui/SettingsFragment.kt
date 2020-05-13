package com.csci448.alperenugus_a3.ui

import android.app.AlertDialog
import android.content.Context
import android.content.DialogInterface
import android.os.Bundle
import android.util.Log
import android.view.*
import androidx.fragment.app.Fragment
import androidx.preference.Preference
import androidx.preference.PreferenceFragmentCompat
import androidx.preference.PreferenceScreen
import com.csci448.alperenugus_a3.R
import com.csci448.alperenugus_a3.data.HistoryRepository

private const val logTag: String = "SettingsFragment"

class SettingsFragment: PreferenceFragmentCompat() {

    private var save2Database: Preference? = null
    private var deleteDatabase: Preference? = null

    private lateinit var historyRepository: HistoryRepository

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        historyRepository = HistoryRepository.getInstance(requireContext())!!
    }

    override fun onCreatePreferences(savedInstanceState: Bundle?, rootKey: String?) {
        setPreferencesFromResource(R.xml.preferences, rootKey)
        val prefScreen: PreferenceScreen? = preferenceScreen

        save2Database = findPreference("database_save")
        deleteDatabase = findPreference("database_delete")

        deleteDatabase?.setOnPreferenceClickListener {

            val dialogBuilder = AlertDialog.Builder(requireContext())

            dialogBuilder.setMessage(R.string.sure)
                // if the dialog is cancelable
                .setCancelable(false)
                // positive button text and action
                .setPositiveButton(R.string.proceed, DialogInterface.OnClickListener {
                        dialog, id ->
                    historyRepository.deleteAll()
                })
                // negative button text and action
                .setNegativeButton(R.string.cancel, DialogInterface.OnClickListener {
                        dialog, id -> dialog.cancel()
                })

            // create dialog box
            val alert = dialogBuilder.create()
            // set title for alert dialog box
            alert.setTitle(R.string.delete_database)
            // show alert dialog
            alert.show()


            true
        }


    }


}