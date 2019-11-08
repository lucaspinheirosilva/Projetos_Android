package com.example.lucas.mediaescolar20;

import android.content.SharedPreferences;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class PrimeiroBimActivity extends AppCompatActivity {

    Button gravar, limpar;

    EditText materiaPrimeiro;
    EditText provaPrimeiro;
    EditText trabalhoPrimeiro;

    TextView txtvwMedia;
    TextView txtvwsituacao;


    Double notaProvaPrime;
    Double notaTrabalhoPrime;
    Double media;

    boolean DadosValidados=true;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_primeirobim);//mudar para outro layout

        gravar = findViewById(R.id.btn_TerceiroBimGravarID);
        limpar = findViewById(R.id.btn_PrimeiroBimLimparID);
        materiaPrimeiro = findViewById(R.id.edtxt_materiaQuartoBimID);
        provaPrimeiro = findViewById(R.id.edtxt_provaQuartoBimID);
        trabalhoPrimeiro = findViewById(R.id.edtxt_trabalQuartoBimID);
        txtvwMedia = findViewById(R.id.txtvw_mediaQuartoFinalID);
        txtvwsituacao = findViewById(R.id.txtvw_resultadoTerceiroFinalID);



        //GRAVAR
        gravar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    //pegar variaveis STRING e convertendo para DOUBlE
                    notaProvaPrime = Double.parseDouble(provaPrimeiro.getText().toString());
                    notaTrabalhoPrime = Double.parseDouble(trabalhoPrimeiro.getText().toString());

                    DadosValidados = true;

                    if (trabalhoPrimeiro.getText().toString().isEmpty()) {
                        trabalhoPrimeiro.requestFocus();
                        trabalhoPrimeiro.setError("*");
                        DadosValidados = false;

                        Toast.makeText(getApplicationContext(), "Campo Nota TRABALHO é Obrigatorio", Toast.LENGTH_LONG).show();
                    }
                    if (provaPrimeiro.getText().toString().isEmpty()) {

                        provaPrimeiro.setError("*");
                        provaPrimeiro.requestFocus();
                        DadosValidados = false;
                        Toast.makeText(getApplicationContext(), "Campo Nota PROVA é Obrigatorio", Toast.LENGTH_LONG).show();
                    }
                    if (materiaPrimeiro.getText().toString().isEmpty()) {
                        materiaPrimeiro.requestFocus();
                        materiaPrimeiro.setError("*");
                        DadosValidados = false;
                        Toast.makeText(getApplicationContext(), "Campo MATERIA é Obrigatorio", Toast.LENGTH_LONG).show();
                    }
                    if (notaTrabalhoPrime>10){
                        trabalhoPrimeiro.requestFocus();
                        trabalhoPrimeiro.setError("*");
                        DadosValidados = false;
                        Toast.makeText(getApplicationContext(), "Nota ACIMA do Permitido, MAXIMO--> 10.00", Toast.LENGTH_LONG).show();
                    }if (notaProvaPrime>10){
                        provaPrimeiro.requestFocus();
                        provaPrimeiro.setError("*");
                        DadosValidados = false;
                        Toast.makeText(getApplicationContext(), "Nota ACIMA do Permitido, MAXIMO--> 10.00", Toast.LENGTH_LONG).show();
                    }
                    else {
                        if (DadosValidados) {

                            media = (notaProvaPrime + notaTrabalhoPrime) / 2;
                            txtvwMedia.setText(MainActivity.formatarDecimal(media));

                            if (media >= 6) {
                                txtvwsituacao.setText("Aprovado");
                                txtvwsituacao.setTextColor(Color.BLUE);
                                txtvwMedia.setTextColor(Color.BLUE);

                                gravar.setEnabled(false);
                                limpar.setEnabled(false);


                                Salvar_SharedPreferences(); //instanciar metodo SharedPreference

                            }
                            if (media <= 5.9) {
                                txtvwsituacao.setText("Reprovado");
                                txtvwsituacao.setTextColor(Color.RED);
                                txtvwMedia.setTextColor(Color.RED);

                                gravar.setEnabled(false);
                                limpar.setEnabled(false);

                                Salvar_SharedPreferences();//instanciar metodo SharedPreference

                            }
                            if (media > 10.1) {
                                txtvwsituacao.setTextColor(Color.MAGENTA);
                                txtvwsituacao.setText("xXx");
                                txtvwMedia.setText(":{");
                                Toast.makeText(getApplicationContext(), "Media Acima de 10,0...\nFavor REVISAR os valores Informados", Toast.LENGTH_LONG).show();
                            }

                            provaPrimeiro.setText(MainActivity.formatarDecimal(notaProvaPrime));
                            trabalhoPrimeiro.setText(MainActivity.formatarDecimal(notaTrabalhoPrime));


                        }else Toast.makeText(getApplicationContext(),"Nota ACIMA do Permitido, MAXIMO--> 10.00", Toast.LENGTH_LONG).show();
                    }
                } catch (Exception Erro) {
                    Toast.makeText(getApplicationContext(), Erro.getMessage(), Toast.LENGTH_LONG).show();
                }

            }
        });


        //LIMPAR
        limpar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                try {
                    if ((materiaPrimeiro.getText().toString().length() == 0) &&
                            (provaPrimeiro.getText().toString().length() == 0) &&
                            (trabalhoPrimeiro.getText().toString().length() == 0)) {

                        Toast.makeText(getApplicationContext(), "Opss!!\nNão ha o que Limpar!!", Toast.LENGTH_LONG).show();
                        gravar.setEnabled(true);

                    } else {
                        materiaPrimeiro.setText("");
                        provaPrimeiro.setText("");
                        trabalhoPrimeiro.setText("");
                        txtvwMedia.setText("0.0");
                        txtvwsituacao.setText("Indefinido");

                        txtvwMedia.setTextColor(Color.BLACK);
                        txtvwsituacao.setTextColor(Color.BLACK);


                        materiaPrimeiro.requestFocus();
                        gravar.setEnabled(true);

                        Toast.makeText(getApplicationContext(), "Todos os Campos Estão Limpos!!", Toast.LENGTH_LONG).show();

                    }


                } catch (Exception Erro) {
                    Toast.makeText(getApplicationContext(), Erro.getMessage(), Toast.LENGTH_LONG).show();
                }


            }
        });

    }

    //SALVAR OS DADOS EM XML ATRAVES DO METODOS SharesPreferences
    private void Salvar_SharedPreferences(){
        SharedPreferences mediaEscolarPref =
                getSharedPreferences(MainActivity.NOME_SHARED_PREFENCES,0);

        SharedPreferences.Editor primeiroBim=mediaEscolarPref.edit();

        primeiroBim.putString("Materia primeiro",materiaPrimeiro.getText().toString());
        primeiroBim.putString("nota Prova primeiro",String.valueOf(notaProvaPrime));
        primeiroBim.putString("nota Trabalho primeiro",String.valueOf(notaTrabalhoPrime));
        primeiroBim.putString("situacao Final primeiro",txtvwsituacao.getText().toString());
        primeiroBim.putString("media final primeiro",String.valueOf(media));
        primeiroBim.putBoolean("Primeiro Bimestre",true);

        primeiroBim.commit();
    }


}