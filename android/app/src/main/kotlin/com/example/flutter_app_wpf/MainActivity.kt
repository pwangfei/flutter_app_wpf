package com.example.flutter_app_wpf

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val channel = "toJava"
    private val channel2 = "toJavaNum"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)


        //flutter调用java原生方法
        MethodChannel(
            flutterEngine!!.dartExecutor.binaryMessenger,
            channel
        ).setMethodCallHandler { methodCall, result ->
            if (methodCall.method != null) {
                result.success(toJava(methodCall.method))
            } else {
                result.notImplemented()
            }
        }

        //flutter调用java原生方法
        MethodChannel(
            flutterEngine!!.dartExecutor.binaryMessenger,
            channel2
        ).setMethodCallHandler { methodCall, result ->
            if (methodCall.method != null) {
                result.success(toJavaNum(methodCall.method))
            } else {
                result.notImplemented()
            }
        }

    }


    fun toJava(name: String): String? {
        println("传递的参数是$name")
        return "您好$name"
    }


    fun toJavaNum(name: String): String? {
        println("这个是toJava2")
        return "这个是toJava2$name"
    }


}
