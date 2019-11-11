package com.example.flutter_trip

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.embedding.android.SplashScreen
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    SplashScreen.show(this, true);
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

  }
}
