package Oneclick.ut.helper;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.graphics.BitmapFactory;
import android.graphics.drawable.ColorDrawable;
import android.location.LocationManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.AsyncTask;
import android.provider.MediaStore;
import android.provider.Settings;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;

import com.airbnb.lottie.LottieAnimationView;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import Oneclick.ut.R;
import Oneclick.ut.views.TextViewRegular;

/**
 * Created by OneClick on 20/03/2019.
 */

public class Utility {

    private static final int MULTIPLE_PERMISSIONS_RESPONSE_CODE = 1;
    private static final int REQUEST_ENABLE_GPS = 999;
    private static String PREFS_NAME = "";

    public static Context mContext;
    //    public BluetoothAdapter mBluetoothAdapter;
    private Activity mActivity;
    private Dialog mDialogProgress;
    private Toast mToast;

    //Default Dialog
    private Dialog mDialogDefault;
    private TextViewRegular mTextViewDialogTitle;
    private TextViewRegular mTextViewDialogMsg;
    private TextViewRegular mTextViewDialogPositiveButton;
    private TextViewRegular mTextViewDialogNegativeButton;

    //Success Dialog
    private Dialog mDialogSuccessDefault;
    private ImageView mImageViewSuccessDialogHeader;
    private TextViewRegular mTextViewSuccessDialogTitle;

    public Utility(Activity mActivity, String prfName) {
        this.mActivity = mActivity;
        this.mContext = mActivity;
        this.PREFS_NAME = prfName;
    }

    public void writeSharedPreferencesString(String key, String value) {
        SharedPreferences settings = mActivity.getSharedPreferences(PREFS_NAME, 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putString(key, value);
        editor.commit();
    }

    public void writeRememberSharedPreferencesString(String key, String value) {
        SharedPreferences settings = mActivity.getSharedPreferences(PREFS_NAME, 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putString(key, value);
        editor.commit();
    }

    public void clearAllPrefData() {
        SharedPreferences settings = mActivity.getSharedPreferences(PREFS_NAME, 0);
        settings.edit().clear().commit();
    }

    public String getAppPrefString(String key) {
        try {
            SharedPreferences settings = mActivity.getSharedPreferences(PREFS_NAME, 0);
            String value = settings.getString(key, "");
            return value;
        } catch (Exception ex) {
            ex.printStackTrace();
            return "";
        }
    }

    public String getAppRememberPrefString(String key) {
        try {
            SharedPreferences settings = mActivity.getSharedPreferences(PREFS_NAME, 0);
            String value = settings.getString(key, "");
            return value;
        } catch (Exception ex) {
            ex.printStackTrace();
            return "";
        }
    }

    public void ShowToast(Activity mActivity, String strMsg) {
        if (mToast == null)
            mToast = Toast.makeText(mActivity, strMsg, Toast.LENGTH_SHORT);
        else
            mToast.setText(strMsg);
        mToast.show();
    }

    public void showToastLong(Activity mActivity, String strMsg) {
        if (mToast == null)
            mToast = Toast.makeText(mActivity, strMsg, Toast.LENGTH_LONG);
        else
            mToast.setText(strMsg);
        mToast.show();
    }


    public void dismissDefaultDialog() {
        if (mDialogDefault != null && mDialogDefault.isShowing()) {
            mDialogDefault.hide();
        }
    }

    public void errorDialogWithClick(String message, DialogInterface.OnClickListener mOnClickListener) {
        androidx.appcompat.app.AlertDialog.Builder mAlertDialogBuilder = new androidx.appcompat.app.AlertDialog.Builder(mActivity);

        mAlertDialogBuilder
                .setMessage(message)
                .setCancelable(false)
                .setPositiveButton("Ok", mOnClickListener);

        AlertDialog alert = mAlertDialogBuilder.create();
        alert.show();
    }

    public void errorDialogWithTitleWithClick(String title, String message, DialogInterface.OnClickListener mOnClickListener) {

        androidx.appcompat.app.AlertDialog.Builder builder = new androidx.appcompat.app.AlertDialog.Builder(mActivity);
        builder.setTitle(title)
                .setMessage(message)
                .setCancelable(false)
                .setNegativeButton(R.string.text_cancel, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int i) {
                        dialog.dismiss();
                    }
                })
                .setPositiveButton(R.string.str_txt_ok, mOnClickListener);

        AlertDialog alert = builder.create();
        alert.show();
    }

    public boolean verifyPermissions(Activity activity, String[] PERMISSIONS_STORAGE) {
        int result;
        List<String> listPermissionsNeeded = new ArrayList<>();
        for (String p : PERMISSIONS_STORAGE) {
            result = ActivityCompat.checkSelfPermission(activity, p);
            if (result != PackageManager.PERMISSION_GRANTED) {
                listPermissionsNeeded.add(p);
            }
        }

        if (!listPermissionsNeeded.isEmpty()) {
            ActivityCompat.requestPermissions(activity,
                    listPermissionsNeeded.toArray(new String[listPermissionsNeeded.size()]),
                    MULTIPLE_PERMISSIONS_RESPONSE_CODE);
            return false;
        }
        return true;
    }

    public boolean checkForParticularPersmission(String mStringPersmission) {
        int result = ActivityCompat.checkSelfPermission(mActivity, mStringPersmission);
        if (result == PackageManager.PERMISSION_GRANTED) {
            return true;
        } else {
            return false;
        }
    }

    public boolean haveInternet() {
        NetworkInfo info = (NetworkInfo) ((ConnectivityManager) mActivity.getSystemService(Context.CONNECTIVITY_SERVICE)).getActiveNetworkInfo();
        if (info == null || !info.isConnected()) {
            return false;
        }
        if (info.isRoaming()) {
            return true;
        }
        return true;
    }

    public void hideKeyboard() {
        View view = mActivity.getCurrentFocus();
        if (view != null) {
            InputMethodManager imm = (InputMethodManager) mActivity.getSystemService(Context.INPUT_METHOD_SERVICE);
            imm.hideSoftInputFromWindow(view.getWindowToken(), 0);
        }
    }

    /**
     * Hides the activity's action bar
     *
     * @param activity the activity
     */
    public static void hideActionBar(Activity activity) {
        // Call before calling setContentView();
        if (activity != null) {
            activity.getWindow().requestFeature(Window.FEATURE_ACTION_BAR);
            if (activity.getActionBar() != null) {
                activity.getActionBar().hide();
            }
        }
    }

    /**
     * Sets the activity in Fullscreen mode
     *
     * @param activity the activity
     */
    public static void setFullScreen(Activity activity) {
        // Call before calling setContentView();
        activity.getWindow()
                .setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                        WindowManager.LayoutParams.FLAG_FULLSCREEN);
    }

    public final boolean isValidEmail(String target) {
        if (target == null) {
            return false;
        } else {
            return android.util.Patterns.EMAIL_ADDRESS.matcher(target).matches();
        }
    }

    public void ShowProgress(boolean isCancelable) {
        if (mDialogProgress != null && mDialogProgress.isShowing()) {
            mDialogProgress.dismiss();
        }

        if (mDialogProgress == null) {
            mDialogProgress = new Dialog(mContext);
            mDialogProgress.requestWindowFeature(Window.FEATURE_NO_TITLE);
            mDialogProgress.getWindow().setBackgroundDrawable(new ColorDrawable(android.graphics.Color.TRANSPARENT));
            mDialogProgress.setContentView(R.layout.raw_progress_layout);
            mDialogProgress.setCancelable(isCancelable);
            mDialogProgress.getWindow().setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        }

        LottieAnimationView mLottieAnimationView = mDialogProgress.findViewById(R.id.raw_progress_layout_animationview);
        mLottieAnimationView.setAnimation("new_loader.json");
        mLottieAnimationView.loop(true);
        mLottieAnimationView.playAnimation();

        try {
            if (!mDialogProgress.isShowing()) {
                mDialogProgress.show();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void HideProgress() {
        try {
            if (mDialogProgress != null && mDialogProgress.isShowing()) {
                mDialogProgress.dismiss();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean isSDK23() {
        return android.os.Build.VERSION.SDK_INT >= 23;
    }

    //region FUNCTION TO SHOW LOG
    public void ShowLog(String mStringActivityName, String mStringTitle, String mStringMessage) {
        System.out.println("Sanjay.... " + mStringActivityName + " " + mStringTitle + " : " + mStringMessage);
    }
    //endregion

    public void ToastMsg(String strMsg) {
        if (mToast == null)
            mToast = Toast.makeText(mActivity, strMsg, Toast.LENGTH_LONG);
        else
            mToast.setText(strMsg);

        View view = mToast.getView();
        TextView text = (TextView) view.findViewById(android.R.id.message);
        text.setTextColor(mActivity.getResources().getColor(R.color.color_white));
        text.setPadding(mActivity.getResources().getDimensionPixelSize(R.dimen._10sdp), 0, mActivity.getResources().getDimensionPixelSize(R.dimen._10sdp), 0);
        view.setBackgroundResource(R.drawable.shape_rounded_background_black);

        mToast.show();
    }

    public String getRealPathFromURI(Uri contentURI) {
        String result = "";
        Cursor cursor = mActivity.getContentResolver().query(contentURI, null, null, null, null);
        if (cursor == null) { // Source is Dropbox or other similar local file path
            result = contentURI.getPath();
        } else {
            cursor.moveToFirst();
            int idx = cursor.getColumnIndex(MediaStore.Images.ImageColumns.DATA);
            result = cursor.getString(idx);
            cursor.close();
        }
        return result;
    }

    public int calculateInSampleSize(BitmapFactory.Options options, int reqWidth, int reqHeight) {
        final int height = options.outHeight;
        final int width = options.outWidth;
        int inSampleSize = 1;

        if (height > reqHeight || width > reqWidth) {
            final int heightRatio = Math.round((float) height / (float) reqHeight);
            final int widthRatio = Math.round((float) width / (float) reqWidth);
            inSampleSize = heightRatio < widthRatio ? heightRatio : widthRatio;
        }
        final float totalPixels = width * height;
        final float totalReqPixelsCap = reqWidth * reqHeight * 2;

        while (totalPixels / (inSampleSize * inSampleSize) > totalReqPixelsCap) {
            inSampleSize++;
        }

        return inSampleSize;
    }

    public boolean isLocationServiceEnabled() {
        LocationManager locationManager = null;
        boolean gps_enabled = false, network_enabled = false;

        if (locationManager == null)
            locationManager = (LocationManager) mActivity.getSystemService(Context.LOCATION_SERVICE);

        try {
            gps_enabled = locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        try {
            network_enabled = locationManager.isProviderEnabled(LocationManager.NETWORK_PROVIDER);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return gps_enabled || network_enabled;
    }


    public void openGpsEnableSetting() {
        Intent intent = new Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS);
        mActivity.startActivityForResult(intent, REQUEST_ENABLE_GPS);
    }

    public void printData(String print) {
        System.out.println(">>>>> " + print);
    }


    public void gotoDashboardAffinity(Class mNextActivity, boolean isFinish) {
        Intent mIntent = new Intent(mActivity, mNextActivity);
        mActivity.startActivity(mIntent);
        if (isFinish) {
            mActivity.finishAffinity();
        }
    }

    public void freeMemory() {
        try {
            System.runFinalization();
            Runtime.getRuntime().gc();
            System.gc();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    public void sendMail(final String mStringURL,
                         final String mStringData,
                         final String mStringError, final String userEmail, final String userPassword, final String recevierEmail) {

        class RetrieveFeedTask extends AsyncTask<String, Void, Void> {

            @Override
            protected Void doInBackground(String... strings) {
                final String username = userEmail;
                final String password = userPassword;

                final String mStringMailBody = "Dear Developer,\n\nAPIs Are Not Working for "
                        + mContext.getResources().getString(R.string.app_name) + " Project"
                        + "\n\nURL : " + mStringURL
                        + "\n\nData : " + mStringData
                        + "\n\nError : " + mStringError;

                Properties props = new Properties();
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.port", "587");

                Session session = Session.getInstance(props,
                        new javax.mail.Authenticator() {
                            protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication(username, password);
                            }
                        });

                try {

                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(userEmail));

                    message.setRecipients(Message.RecipientType.TO,
                            InternetAddress.parse(recevierEmail));

                    message.setSubject(mContext.getResources().getString(R.string.app_name) + " API Not Working");

                    message.setText(mStringMailBody);

                    Transport.send(message);

                    System.out.println("OneClick Error Mail Done : " + mStringMailBody);
                    System.out.println("OneClick Error Mail Subject : " + message.getSubject());

                } catch (MessagingException e) {
                    e.printStackTrace();
                    throw new RuntimeException(e);
                }
                return null;
            }
        }

        new RetrieveFeedTask().execute();

    }


    /**
     * Check if the service is running in the device.
     *
     * @param context      the context
     * @param serviceClass the service class
     * @return boolean boolean
     */
    public static boolean isServiceRunning(Context context, Class<?> serviceClass) {
        try {
            ActivityManager manager =
                    (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
            for (ActivityManager.RunningServiceInfo service : manager.getRunningServices(
                    Integer.MAX_VALUE)) {
                if (serviceClass.getName().equals(service.service.getClassName())) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    /**
     * Read and parse a JSON file stored in assets folder
     *
     * @param context  the context
     * @param filename the filename
     * @return the json object
     */
    public JSONObject loadJSONFromAsset(Context context, String filename) {
        String json = null;
        JSONObject jsonObject = null;
        try {

            InputStream is = context.getAssets().open(filename);

            int size = is.available();

            byte[] buffer = new byte[size];

            final int read = is.read(buffer);
            is.close();
            if (read > 0) {
                json = new String(buffer, "UTF-8");
            }
        } catch (IOException ex) {
            ex.printStackTrace();
            return null;
        }

        try {
            jsonObject = new JSONObject(json);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jsonObject;
    }

    /**
     * Iterate over all keys of the JSON
     *
     * @param jsonObject the json object
     * @return the hash map
     */
    public static HashMap<String, String> iterateOverJSON(JSONObject jsonObject) {
        Iterator<String> iter = jsonObject.keys();
        HashMap<String, String> keyValueMap = new HashMap<>();
        while (iter.hasNext()) {
            String key = iter.next();
            try {
                String value = jsonObject.getString(key);
                keyValueMap.put(key, value);
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        return keyValueMap;
    }


    public void copyText(String text) {
        ClipboardManager clipboard = (ClipboardManager) mContext.getSystemService(Context.CLIPBOARD_SERVICE);
        ClipData clip = ClipData.newPlainText("", text);
        clipboard.setPrimaryClip(clip);
    }

    public static int getDeviceWidth() {
        return mContext.getResources().getDisplayMetrics().widthPixels;
    }

    public static int getDeviceHeight() {
        return mContext.getResources().getDisplayMetrics().heightPixels;
    }

}

