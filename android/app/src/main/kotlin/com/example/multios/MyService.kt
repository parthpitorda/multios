package com.example.multios

import android.app.Service
import android.content.Intent
import android.os.IBinder
import androidx.core.app.NotificationCompat
import androidx.core.content.ContextCompat.getSystemService
import android.icu.lang.UCharacter.GraphemeClusterBreak.T
import android.widget.Toast
import java.util.*
import androidx.core.os.HandlerCompat.postDelayed
import androidx.core.content.ContextCompat.getSystemService
import android.icu.lang.UCharacter.GraphemeClusterBreak.T
import android.os.Handler
import androidx.core.content.ContextCompat.getSystemService
import android.icu.lang.UCharacter.GraphemeClusterBreak.T
import com.google.firebase.database.DatabaseReference
import com.google.firebase.database.FirebaseDatabase
import androidx.core.content.ContextCompat.getSystemService
import android.icu.lang.UCharacter.GraphemeClusterBreak.T




class MyService : Service() {
    lateinit var mDatabase: DatabaseReference

    override fun onBind(p0: Intent?): IBinder? {
        return null
    }

    override fun onCreate() {
        super.onCreate()

        val builder = NotificationCompat.Builder(this, "message")
                .setSmallIcon(R.drawable.common_google_signin_btn_icon_dark)
                .setContentTitle("Notifications Example")
                .setContentText("This is a notification message")
                .setAutoCancel(true)
                .setPriority(NotificationCompat.PRIORITY_DEFAULT)

        startForeground(188, builder.build())

        FirebaseDatabase.getInstance().setPersistenceEnabled(true)

        mDatabase = FirebaseDatabase.getInstance().reference


        val ha = Handler()
        ha.postDelayed(object : Runnable {

            override fun run() {

                println("hola")

                ha.postDelayed(this, 10000)
            }
        }, 10000)
    }

}