package com.example.lucasps.mediaescolharmvc.view;

import android.content.Context;
import android.content.Intent;
import android.graphics.Typeface;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.ActivityOptionsCompat;
import android.support.v7.app.AppCompatActivity;
import android.widget.TextView;

import com.example.lucasps.mediaescolharmvc.R;
import com.example.lucasps.mediaescolharmvc.controller.MediaEscolarController;
import com.example.lucasps.mediaescolharmvc.datasource.DataSource;
import com.example.lucasps.mediaescolharmvc.model.MediaEscolar;

public class MainSplash extends AppCompatActivity {

    TextView textoSplash;
    TextView textoMVCSplash;
    Context contextoBase;

    String caminho = "fonts/";
    String ttf_fat_tats = "Fat_Tats.ttf";

    private static final int TEMPO_SAIDA_SPLASH=3500;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_splash);

        textoSplash = findViewById(R.id.txtvw_tituloSplashID);
        textoMVCSplash = findViewById(R.id.txtvw_tituloMCVSplashID);

        Typeface ttfSplash = Typeface.createFromAsset(getAssets(),caminho+ttf_fat_tats);
        textoSplash.setTypeface(ttfSplash);
        textoMVCSplash.setTypeface(ttfSplash);

        contextoBase = getBaseContext();

        ApresentarTelaSplash();
    }

    private void  ApresentarTelaSplash(){
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                DataSource ds = new DataSource(getApplicationContext());
                MediaEscolar obj = new MediaEscolar();

                MediaEscolarController mediaescolarcontroller = new MediaEscolarController(contextoBase);
                mediaescolarcontroller.backupBandoDeDados();


                Intent intent_chamarTela = new Intent(MainSplash.this,MainActivity.class);
                ActivityOptionsCompat activity_options_compat =
                        ActivityOptionsCompat.makeCustomAnimation(getApplicationContext(),R.anim.fade_in,R.anim.mover_direita);
                ActivityCompat.startActivity(MainSplash.this,intent_chamarTela,activity_options_compat.toBundle());

                finish();

            }
        }, TEMPO_SAIDA_SPLASH);
    }


}
