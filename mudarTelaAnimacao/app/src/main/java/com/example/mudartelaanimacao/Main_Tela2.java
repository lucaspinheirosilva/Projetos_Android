package com.example.mudartelaanimacao;

import android.graphics.Typeface;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class Main_Tela2 extends AppCompatActivity {

    TextView textoTitulo2Tela;

    String caminho = "fonts/";
    String OrangeJuice  = "orange_juice_2.0.ttf";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main__tela2);

        textoTitulo2Tela = findViewById(R.id.txtvw_tela2tituloID);

        //****TYPE FACE****//
        Typeface ttf_2Tela = Typeface.createFromAsset(getAssets(),caminho+OrangeJuice);
        textoTitulo2Tela.setTypeface(ttf_2Tela);


    }

    @Override
    public void finish() {
        super.finish();

        overridePendingTransition(R.anim.mover_esquerda,R.anim.fade_out);
    }
}
