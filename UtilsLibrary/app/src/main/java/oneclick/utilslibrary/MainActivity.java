package oneclick.utilslibrary;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

import java.util.HashMap;

import Oneclick.ut.TestUtils;
import Oneclick.ut.helper.SaveHashMapToFileIOUtil;
import Oneclick.ut.helper.Utility;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        TestUtils.showToast(this, "good its working");
        Utility utility = new Utility(this, "");
        utility.ShowToast(this, "jay");
        utility.sendMail("","","","infopitroda2017@gmail.com",
                "Parth@pitroda88","parthpitroda@itoneclick.com");
        HashMap<String, String> h = new HashMap<>();
        h.put("pk","pk");
        h.put("fsafsf","fasdf");

        SaveHashMapToFileIOUtil.saveHashMapToFile(this,"parthparth.txt",h);
    }
}
