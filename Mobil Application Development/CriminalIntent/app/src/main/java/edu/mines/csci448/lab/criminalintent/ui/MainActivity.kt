package edu.mines.csci448.lab.criminalintent.ui

import android.os.Bundle
import android.util.Log
import android.widget.FrameLayout
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.ViewModelProvider
import edu.mines.csci448.lab.criminalintent.R
import edu.mines.csci448.lab.criminalintent.ui.detail.CrimeDetailFragment
import edu.mines.csci448.lab.criminalintent.ui.list.CrimeListFragment
import edu.mines.csci448.lab.criminalintent.ui.list.CrimeListViewModel
import edu.mines.csci448.lab.criminalintent.ui.list.CrimeListViewModelFactory
import edu.mines.csci448.lab.criminalintent.ui.pager.CrimePagerFragment
import java.util.*

private val logTag = "448.MainActivity"

class MainActivity : AppCompatActivity(), CrimeListFragment.Callbacks {

    // Check the orientation to put the detail fragment aside by the list fragment
    private var detailFragmentContainer: FrameLayout? = null

    override fun onCrimeSelected(crimeId: UUID) {
        Log.d(logTag, "MainActivity.onCrimeSelected: $crimeId")

        // Portrait Mode
        if(detailFragmentContainer == null){
            // Change the fragment with respect to the crime id
            val fragment = CrimePagerFragment.newInstance(crimeId)
            supportFragmentManager
                .beginTransaction()
                .replace(R.id.fragment_container, fragment)
                .addToBackStack(null)
                .commit()
        }
            // Landscape Mode
        else{
            val fragment = CrimePagerFragment.newInstance(crimeId)
            supportFragmentManager
                .beginTransaction()
                .replace(R.id.detail_fragment_container, fragment)
                //.addToBackStack(null)
                .commit()
        }



    }

    private lateinit var crimeListViewModel: CrimeListViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.d(logTag, "onCreate() called")
        setContentView(R.layout.activity_masterdetail)

        // Bind detailFragmentContainer if in landscape mode
        detailFragmentContainer = findViewById(R.id.detail_fragment_container)

        // Factory for the ViewModel
        val factory = CrimeListViewModelFactory(baseContext)
        crimeListViewModel = ViewModelProvider(this, factory)
            .get(CrimeListViewModel::class.java)

        // Get the current fragment if it exists in savedInstanceState
        val currentFragment = supportFragmentManager.findFragmentById(R.id.fragment_container)
        // If no saved fragment list, then create a new fragment
        if(currentFragment == null){
            val fragment = CrimeListFragment()
            supportFragmentManager.beginTransaction()
                .add(R.id.fragment_container, fragment)
                .commit()
        }
    }

    override fun onStart() {
        super.onStart()
        Log.d(logTag, "onStart() called")
    }

    override fun onResume() {
        super.onResume()
        Log.d(logTag, "onResume() called")
    }

    override fun onPause() {
        Log.d(logTag, "onPause() called")
        super.onPause()
    }

    override fun onStop() {
        Log.d(logTag, "onStop() called")
        super.onStop()
    }

    override fun onDestroy() {
        Log.d(logTag, "onDestroy() called")
        super.onDestroy()
    }
}