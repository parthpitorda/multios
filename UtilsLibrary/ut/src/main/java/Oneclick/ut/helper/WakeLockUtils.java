package Oneclick.ut.helper;

import android.content.Context;
import android.os.PowerManager;

/**
 * The type Wake lock utils.
 *
 * @author OneClick
 */
public class WakeLockUtils {

    /**
     * The Wake lock.
     */
    private static PowerManager.WakeLock wakeLock;

    public static void holdWakeLock(Context context) {
        holdWakeLockTimed(context, 3600);
    }

    /**
     * Hold wake lock.
     *
     * @param context the context
     */
    public static void holdWakeLockTimed(Context context, long time) {
        PowerManager powerManager = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
        wakeLock = powerManager.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "MyWakeLock");
        wakeLock.acquire(time);
    }

    /**
     * Release wake lock.
     */
    public static void releaseWakeLock() {
        if (wakeLock != null && wakeLock.isHeld()) {
            wakeLock.release();
        }
    }

    private WakeLockUtils() {
        throw new UnsupportedOperationException(
                "Should not create instance of Util class. Please use as static..");
    }
}