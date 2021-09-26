package com.digitalraiz.socilybrand

import android.app.Activity
import android.os.Bundle
import android.view.WindowManager.LayoutParams
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity


class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)


        if (BuildConfig.DEBUG!=true) {
            getWindow().addFlags(LayoutParams.FLAG_SECURE);
        }



    }




}
