package com.example.mudartelaanimacao;

import android.app.ActivityOptions;
import android.content.Intent;
import android.graphics.Typeface;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.ActivityOptionsCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {

    Button btn_chamarOutraTela;

    String caminho = "fonts/";
    String StripedSansBlack = "StripedSansBlack.ttf";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btn_chamarOutraTela = findViewById(R.id.btn_tela1ID);

        Typeface ttf_ChamarTela = Typeface.createFromAsset(getAssets(),caminho+StripedSansBlack);
        btn_chamarOutraTela.setTypeface(ttf_ChamarTela);

        btn_chamarOutraTela.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent_chamarTela = new Intent(MainActivity.this,Main_Tela2.class);
                ActivityOptionsCompat activityoptionscompat =
                        ActivityOptionsCompat.makeCustomAnimation(getApplicationContext(),R.anim.fade_in,R.anim.mover_direita);
                ActivityCompat.startActivity(MainActivity.this,intent_chamarTela,activityoptionscompat.toBundle());


            }
        });
    }

}
