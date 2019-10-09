package com.softcom.zeitgeist;

import android.content.Intent;
import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

  private static final String CHANNEL = "com.softcom.zeitgeist/map_view";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);


    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
            (call, result) -> {
              if(call.method.equals("openmapview"))
                startActivity(new Intent(this, GMapViewActivity.class));
            });
  }

}
