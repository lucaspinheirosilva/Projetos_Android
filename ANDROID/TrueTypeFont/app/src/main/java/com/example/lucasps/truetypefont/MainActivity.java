package com.example.lucasps.truetypefont;

import android.graphics.Typeface;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;
import android.widget.Toast;


public class MainActivity extends AppCompatActivity {

    //DEFINE OS NOMES DOS TEXTVIEWS
TextView txtvw_nomeTeste;
TextView txtvw_nomeTeste2;
TextView txtvw_nomeTeste3;
TextView txtvw_nomeTeste4;

//DEFINE A PASTA E O NOME DAS FONTS
String pasta="fonts/";
String ttf_specialRequest = "SpecialRequest.ttf";
String ttf_NationalCartoon = "NationalCartoon.ttf";
String ttf_BrittaniaModernCalligraphy = "BrittaniaModernCalligraphy.ttf";
String ttf_ThisNight = "ThisNight.ttf";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        txtvw_nomeTeste = findViewById(R.id.txtvw_nome);
        txtvw_nomeTeste2 = findViewById(R.id.txtvw_nome2);
        txtvw_nomeTeste3 = findViewById(R.id.txtvw_nome3);
        txtvw_nomeTeste4 = findViewById(R.id.txtvw_nome4);

        try {
            //--ttf_specialRequest
            Typeface ttf = Typeface.createFromAsset(getAssets(),pasta+ttf_specialRequest);
            txtvw_nomeTeste.setTypeface(ttf);

            //--ttf_BrittaniaModernCalligraphy
            Typeface ttf2 = Typeface.createFromAsset(getAssets(),pasta+ttf_BrittaniaModernCalligraphy);
            txtvw_nomeTeste2.setTypeface(ttf2);

            //--ttf_ThisNight
            Typeface ttf3 = Typeface.createFromAsset(getAssets(),pasta+ttf_ThisNight);
            txtvw_nomeTeste3.setTypeface(ttf3);

            //--ttf_NationalCartoon
            Typeface ttf4 = Typeface.createFromAsset(getAssets(),pasta+ttf_NationalCartoon);
            txtvw_nomeTeste4.setTypeface(ttf4);

        }catch (Exception erro){
            Toast.makeText(getApplicationContext(),erro.getMessage(),Toast.LENGTH_LONG).show();
        }

    }
}
