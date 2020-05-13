package theinvestors.csci448.geolocatr

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.util.Log
import androidx.concurrent.futures.CallbackToFutureAdapter
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import androidx.core.content.ContextCompat
import androidx.work.ListenableWorker
import androidx.work.WorkerParameters
import com.google.android.gms.location.FusedLocationProviderClient
import com.google.android.gms.location.LocationServices
import com.google.common.util.concurrent.ListenableFuture

private const val logTag: String = "LocatrWorker"

private const val FINE_LOCATION_PERMISSION =
    android.Manifest.permission.ACCESS_FINE_LOCATION

class LocatrWorker(private var context: Context, workerParams: WorkerParameters) : ListenableWorker(context, workerParams) {

    private lateinit var fusedLocationProviderClient:
            FusedLocationProviderClient


    override fun startWork(): ListenableFuture<Result> {
        Log.d(logTag, "Work triggered")
        return CallbackToFutureAdapter.getFuture { completer ->
            // do task on background thread

            fusedLocationProviderClient =
                LocationServices.getFusedLocationProviderClient(context)

            if(ContextCompat.checkSelfPermission(context,
                    FINE_LOCATION_PERMISSION )== PackageManager.PERMISSION_GRANTED
            ){
                fusedLocationProviderClient.lastLocation.addOnSuccessListener{ location ->
                    // do something with the location
                    Log.d(logTag, "Got a location: $location")

                    val notificationManager = NotificationManagerCompat.from(context)
                    val channelID =
                        context.resources.getString(R.string.notification_channel_id)

                    if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                        // version is Oreo or higher
                        // version is API 26 or higher
                        // version is Android 8.0 or higher
                        val name = context.resources.getString(R.string.notification_channel_name)
                        val descriptionText = context.resources.getString(R.string.notification_channel_desc)
                        val importance = NotificationManager.IMPORTANCE_DEFAULT
                        val channel = NotificationChannel(channelID, name, importance).apply {
                            description = descriptionText
                        }
                        notificationManager.createNotificationChannel(channel)
                    }

                    val pendingIntent = MainActivity.createIntent(context, location)

                    val notification = NotificationCompat.Builder(context, channelID)
                        .setSmallIcon(R.drawable.ic_menu_location)
                        .setContentTitle( context.resources.getString(R.string.notification_title))
                        .setContentText("Lat: ${location.latitude} Lng: ${location.longitude}")
                        .setAutoCancel(true)
                        .setContentIntent(pendingIntent)
                        .build()

                    notificationManager.notify(0, notification)


                    completer.set( Result.success() )
                }
            }
        }
    }

}