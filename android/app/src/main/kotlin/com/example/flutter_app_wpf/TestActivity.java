package com.example.flutter_app_wpf;

import android.os.Bundle;
import android.os.PersistableBundle;

import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class TestActivity  extends FlutterActivity{
    private static final String channel = "toJava";
    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(),channel).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                        if (methodCall.method!=null) {
                            result.success(toJava(methodCall.method));
                        } else {
                            result.notImplemented();
                        }
                    }
                }
        );


    }

    public String toJava(String name){
        System.out.println("传递的参数是"+name);
        return "您好"+name;
    }

}
