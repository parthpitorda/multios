package Oneclick.ut.views;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Typeface;
import android.util.AttributeSet;
import android.widget.TextView;

/**
 * Created by oneclick on 9/10/17.
 */

@SuppressLint("AppCompatCustomView")
public class TextViewSemiBold extends TextView {

    public TextViewSemiBold(Context context) {
        super(context);
        Typeface face = Typeface.createFromAsset(context.getAssets(), "ProximaNova-Semibold.otf");
        this.setTypeface(face);
    }

    public TextViewSemiBold(Context context, AttributeSet attrs) {
        super(context, attrs);
        Typeface face = Typeface.createFromAsset(context.getAssets(), "ProximaNova-Semibold.otf");
        this.setTypeface(face);
    }

    public TextViewSemiBold(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        Typeface face = Typeface.createFromAsset(context.getAssets(), "ProximaNova-Semibold.otf");
        this.setTypeface(face);
    }

    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
    }

}
