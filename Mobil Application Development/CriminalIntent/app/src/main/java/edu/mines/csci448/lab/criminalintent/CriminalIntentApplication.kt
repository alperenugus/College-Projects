package edu.mines.csci448.lab.criminalintent

import android.app.Application
import android.util.Log

class CriminalIntentApplication: Application() {

    private val logTag = "Application Log Tag"

    override fun onCreate() {
        super.onCreate()
        Log.d(logTag, "onCreate() called")
    }

}