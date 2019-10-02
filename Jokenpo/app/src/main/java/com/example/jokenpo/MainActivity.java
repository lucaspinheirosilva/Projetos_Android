package com.example.jokenpo;

import android.graphics.Color;
import android.media.MediaPlayer;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.Switch;
import android.widget.TextView;

import java.util.Random;

import static com.example.jokenpo.R.raw.perdedor;

public class MainActivity extends AppCompatActivity {

    ImageView imgEscolhaApp;
    ImageView imgPedra;
    ImageView imgPapel;
    ImageView imgTesoura;
    ImageView imgResultado;

    TextView txtvw_ResultadoFinal;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        imgEscolhaApp = findViewById(R.id.imgvw_escolhaApp);
        imgPapel = findViewById(R.id.imgvw_papel);
        imgPedra = findViewById(R.id.imgvw_pedra);
        imgTesoura = findViewById(R.id.imgvw_tesoura);
        imgResultado = findViewById(R.id.imgvw_resultado);

        txtvw_ResultadoFinal = findViewById(R.id.txtvw_resultadoFinal);

    }

    //Evento OnClick Feito no ImageView
    public void selecinarPedra(View view) {
        opçaoSelecionada("Pedra");
    }

    public void selecinarPapel(View view) {
        opçaoSelecionada("Papel");
    }

    public void selecinarTesoura(View view) {
        opçaoSelecionada("Tesoura");
    }

    public void opçaoSelecionada(String escolhaUsuario) {

        int numero = new Random().nextInt(3);//0,1,2 = 3 posiçoes

        String[] opçoes = {"Pedra", "Papel", "Tesoura"};
        String escolhaApp;
        escolhaApp = opçoes[numero];

        switch (escolhaApp) {
            case "Pedra": {
                imgEscolhaApp.setImageResource(R.drawable.pedra_arrumado);
                break;
            }
            case "Papel": {
                imgEscolhaApp.setImageResource(R.drawable.papel_arrumado);
                break;
            }
            case "Tesoura": {
                imgEscolhaApp.setImageResource(R.drawable.tesoura_arrumado);
                break;
            }
        }
        //Voce Perde
        if ((escolhaUsuario.equals("Pedra") && escolhaApp.equals("Papel")) ||
                (escolhaUsuario.equals("Tesoura") && escolhaApp.equals("Pedra")) ||
                (escolhaUsuario.equals("Papel") && escolhaApp.equals("Tesoura"))) {


            somPerdedor();
            txtvw_ResultadoFinal.setText("Voce Perdeu!!  :(");
            imgResultado.setImageResource(R.drawable.loser);
            txtvw_ResultadoFinal.setTextColor(Color.parseColor("#FF4646"));


            //Voce Ganha
        } else if ((escolhaApp.equals("Pedra") && escolhaUsuario.equals("Papel")) ||
                (escolhaApp.equals("Tesoura") && escolhaUsuario.equals("Pedra")) ||
                (escolhaApp.equals("Papel") && escolhaUsuario.equals("Tesoura"))) {

            txtvw_ResultadoFinal.setText("Voce Ganhou!! =]");
            imgResultado.setImageResource(R.drawable.fireworks);
            txtvw_ResultadoFinal.setTextColor(Color.parseColor("#A6FF3A"));
        }
        //Empate
        else {
            txtvw_ResultadoFinal.setText("Empatou !!  O_o");
            imgResultado.setImageResource(R.drawable.empatou);
            txtvw_ResultadoFinal.setTextColor(Color.parseColor("#F9C65B"));

        }

    }
    public void somPerdedor(){
        MediaPlayer somPerdedor = MediaPlayer.create(this,R.raw.perdedor);
        somPerdedor.start();
    }
}
