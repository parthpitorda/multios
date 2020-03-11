package Oneclick.ut;

import android.content.Context;
import android.view.View;
import android.widget.Toast;

import com.bumptech.glide.Glide;

public class TestUtils {

    public static boolean showToast(Context context,String msg){
        try{
            Toast.makeText(context, msg, Toast.LENGTH_SHORT).show();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public static boolean loadImageInView(View view){
        try{
            Glide.get(view.getContext().getApplicationContext());
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
}
