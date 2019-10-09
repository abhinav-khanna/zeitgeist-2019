package com.softcom.zeitgeist;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Objects;

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

    String path = getApplicationInfo().dataDir;
    new DownloadFileFromURL().execute("https://drive.google.com/uc?export=download&id=1Xro62gx7hHYDKWIqkj8JLLvaCabG7fo-", path);
  }

}

class DownloadFileFromURL extends AsyncTask<String, String, String> {

    /**
     * Downloading file in background thread
     * */
    @Override
    protected String doInBackground(String... params) {
        int count;
        try {
            URL url = new URL(params[0]);
            URLConnection conection = url.openConnection();
            conection.connect();
            // this will be useful so that you can show a tipical 0-100% progress bar
            int lenghtOfFile = conection.getContentLength();

            // download the file
            InputStream input = new BufferedInputStream(url.openStream(), 8192);

            // Output stream

            OutputStream output = new FileOutputStream(params[1] + "/zeitgeist.kml");

            byte[] data = new byte[1024];

            long total = 0;

            while ((count = input.read(data)) != -1) {
                total += count;
                // publishing the progress....
                // After this onProgressUpdate will be called
                publishProgress(""+(int)((total*100)/lenghtOfFile));

                // writing data to file
                output.write(data, 0, count);
            }

            // flushing output
            output.flush();

            // closing streams
            output.close();
            input.close();

        } catch (Exception e) {
            Log.e("Error: ", Objects.requireNonNull(e.getMessage()));
        }

        return null;
    }


}