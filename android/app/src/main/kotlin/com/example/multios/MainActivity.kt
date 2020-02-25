package com.example.multios

import android.content.Intent
import android.os.Build
import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import androidx.core.content.ContextCompat.getSystemService
import android.icu.lang.UCharacter.GraphemeClusterBreak.T
import androidx.core.os.HandlerCompat.postDelayed
import androidx.core.content.ContextCompat.getSystemService
import android.icu.lang.UCharacter.GraphemeClusterBreak.T
import android.os.Handler


class MainActivity : FlutterActivity() {

    private lateinit var inten: Intent

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        inten = Intent(this, MyService::class.java)

        MethodChannel(flutterView, "coco").setMethodCallHandler { call, result ->
            if (call.method == "startService") {
                getStartService()

                val ha = Handler()
                ha.postDelayed(object : Runnable {

                    override fun run() {

                        println(">>>>>>>>>>>>>>>>>>>>hola")
                        MethodChannel(flutterView, "coco")
                                .invokeMethod("updateLocation", "")

                        ha.postDelayed(this, 10000)
                    }
                }, 10000)

                result.success("Service Started")
            } else if (call.method == "stopService") {
                getStopService()
                result.success("Service Stop")
            }
        }
    }

    private fun getStartService() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForegroundService(inten)
        } else {
            startService(inten)
        }
    }

    private fun getStopService() {
        stopService(inten)
    }
}
