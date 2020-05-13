package theinvestors.csci448.geolocatr

import android.app.Activity
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.location.Location
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import androidx.navigation.NavDeepLinkBuilder
import androidx.navigation.findNavController
import androidx.navigation.ui.NavigationUI

private const val logTag = "MainActivity"

class MainActivity : AppCompatActivity() {

    companion object{
        fun createIntent(context: Context, location: Location): PendingIntent {
            val args: Bundle = Bundle()
            args.putDouble("lat", location.latitude)
            args.putDouble("lng", location.longitude)

            val pendingIntent = NavDeepLinkBuilder(context)
                .setGraph(R.navigation.nav_graph)
                .setDestination(R.id.locatrFragment)
                .setArguments(args)
                .createPendingIntent()
            return pendingIntent
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        NavigationUI.setupActionBarWithNavController(this,
            findNavController(R.id.nav_host_fragment))
    }

    override fun onSupportNavigateUp(): Boolean =
        findNavController(R.id.nav_host_fragment).navigateUp()
                || super.onSupportNavigateUp()

    override fun onActivityResult(requestCode: Int, resultCode: Int, data:
    Intent?) {
        Log.d(logTag, "onActivityResult() is called")
        if(requestCode == LocatrFragment.REQUEST_LOC_ON) {

            val locatrFragment = supportFragmentManager.findFragmentById(R.id.nav_host_fragment)?.
            childFragmentManager?.fragments?.get(0) as LocatrFragment?

            locatrFragment?.onActivityResult(requestCode, resultCode, data)

            // Handling activity result without trying to get the activity using supportFragmentManager
//            if(resultCode != Activity.RESULT_OK) {
//                return
//            }
//            if(requestCode == LocatrFragment.REQUEST_LOC_ON) {
//                LocatrFragment.locationUpdateState = true
//                invalidateOptionsMenu()
//            }

        } else {
            super.onActivityResult(requestCode, resultCode, data)
        }
    }
}
