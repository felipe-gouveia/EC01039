package br.belem.felipegouveia.textrecognizer;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.os.Environment;
import android.util.Log;

import com.googlecode.tesseract.android.TessBaseAPI;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * Created by Felipe on 24/10/2017.
 */

public class MyTessOCR {

    private String datapath;
    private TessBaseAPI mTess;
    Context context;

    public MyTessOCR(Context context) {
        // TODO Auto-generated constructor stub
        this.context = context;
        datapath = Environment.getExternalStorageDirectory() + "/ec01039/";
        File dir = new File(datapath + "/tessdata/");
        File file = new File(datapath + "/tessdata/" + "por.traineddata");
        if (!file.exists()) {
            Log.d("mylog", "in file doesn't exist");
            dir.mkdirs();
            copyFile(context);
        }

        mTess = new TessBaseAPI();
        String language = "por";
        mTess.init(datapath, language);
        //Auto only
        mTess.setPageSegMode(TessBaseAPI.PageSegMode.PSM_AUTO_ONLY);
    }

    public void stopRecognition() {
        mTess.stop();
    }

    public String getOCRResult(Bitmap bitmap) {
        mTess.setImage(bitmap);
        String result = mTess.getUTF8Text();
        return result;
    }

    public void onDestroy() {
        if (mTess != null)
            mTess.end();
    }

    private void copyFile(Context context) {
        AssetManager assetManager = context.getAssets();
        try {
            InputStream in = assetManager.open("por.traineddata");
            OutputStream out = new FileOutputStream(datapath + "/tessdata/" + "por.traineddata");
            byte[] buffer = new byte[1024];
            int read = in.read(buffer);
            while (read != -1) {
                out.write(buffer, 0, read);
                read = in.read(buffer);
            }
        } catch (Exception e) {
            Log.d("mylog", "couldn't copy with the following error : " + e.toString());
        }
    }
}