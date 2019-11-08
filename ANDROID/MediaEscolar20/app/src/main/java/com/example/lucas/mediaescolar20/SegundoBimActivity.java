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

public class SegundoBimActivity extends AppCompatActivity {

    Button gravar,limpar;

    EditText materiaSegundo;
    EditText provaSegundo;
    EditText trabalhoSegundo;

    TextView txtvwMedia;
    TextView txtvwsituacao;

    Double notaProvaSeg;
    Double notaTrabalhoSeg;
    Double media;

    boolean DadosValidados = true;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_segundobim);

        gravar=findViewById(R.id.btn_SegundoBimGravarID);
        limpar=findViewById(R.id.btn_SegundoBimLimparID);
        materiaSegundo=findViewById(R.id.edtxt_materiaSegundoBimID);
        provaSegundo=findViewById(R.id.edtxt_provaSegundoBimID);
        trabalhoSegundo=findViewById(R.id.edtxt_trabalSegundoBimID);
        txtvwMedia=findViewById(R.id.txtvw_mediaSegundoFinalID);
        txtvwsituacao=findViewById(R.id.txtvw_resultadoSegundoFinalID);


        //GRAVAR
        gravar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                try {
                    //pegar variaveis STRING e convertendo para DOUBlE
                    notaProvaSeg = Double.parseDouble(provaSegundo.getText().toString());
                    notaTrabalhoSeg = Double.parseDouble(trabalhoSegundo.getText().toString());

                    DadosValidados = true;

                    if (trabalhoSegundo.getText().toString().isEmpty()) {
                        trabalhoSegundo.requestFocus();
                        trabalhoSegundo.setError("*");
                        DadosValidados = false;

                        Toast.makeText(getApplicationContext(), "Campo Nota TRABALHO é Obrigatorio", Toast.LENGTH_LONG).show();
                    }
                    if (provaSegundo.getText().toString().isEmpty()) {

                        provaSegundo.setError("*");
                        provaSegundo.requestFocus();
                        DadosValidados = false;
                        Toast.makeText(getApplicationContext(), "Campo Nota PROVA é Obrigatorio", Toast.LENGTH_LONG).show();
                    }
                    if (materiaSegundo.getText().toString().isEmpty()) {
                        materiaSegundo.requestFocus();
                        materiaSegundo.setError("*");
                        DadosValidados = false;
                        Toast.makeText(getApplicationContext(), "Campo MATERIA é Obrigatorio", Toast.LENGTH_LONG).show();
                    }
                    if (notaTrabalhoSeg>10){
                        trabalhoSegundo.requestFocus();
                        trabalhoSegundo.setError("*");
                        DadosValidados = false;
                        Toast.makeText(getApplicationContext(), "Nota ACIMA do Permitido, MAXIMO--> 10.00", Toast.LENGTH_LONG).show();
                    }if (notaTrabalhoSeg>10){
                        provaSegundo.requestFocus();
                        provaSegundo.setError("*");
                        DadosValidados = false;
                        Toast.makeText(getApplicationContext(), "Nota ACIMA do Permitido, MAXIMO--> 10.00", Toast.LENGTH_LONG).show();
                    }
                    else {
                        if (DadosValidados) {

                            media = (notaProvaSeg + notaTrabalhoSeg) / 2;
                            txtvwMedia.setText(MainActivity.formatarDecimal(media));

                            if (media >= 6) {
                                txtvwsituacao.setText("Aprovado");
                                txtvwsituacao.setTextColor(Color.BLUE);
                                txtvwMedia.setTextColor(Color.BLUE);

                                gravar.setEnabled(false);
                                limpar.setEnabled(false);


                                Salvar_SharedPrefences(); //instanciar metodo SharedPreference

                            }
                            if (media <= 5.9) {
                                txtvwsituacao.setText("Reprovado");
                                txtvwsituacao.setTextColor(Color.RED);
                                txtvwMedia.setTextColor(Color.RED);

                                gravar.setEnabled(false);
                                limpar.setEnabled(false);

                                Salvar_SharedPrefences();//instanciar metodo SharedPreference


                            }
                            if (media > 10.1) {
                                txtvwsituacao.setTextColor(Color.MAGENTA);
                                txtvwsituacao.setText("xXx");
                                txtvwMedia.setText(":{");
                                Toast.makeText(getApplicationContext(), "Media Acima de 10,0...\nFavor REVISAR os valores Informados", Toast.LENGTH_LONG).show();
                            }

                            provaSegundo.setText(MainActivity.formatarDecimal(notaTrabalhoSeg));
                            trabalhoSegundo.setText(MainActivity.formatarDecimal(notaTrabalhoSeg));


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
                            if ((materiaSegundo.getText().toString().length()==0)&&
                                    (provaSegundo.getText().toString().length()==0)&&
                                    (trabalhoSegundo.getText().toString().length()==0)){

                                gravar.setEnabled(true);
                                limpar.setEnabled(false);

                                Toast.makeText(getApplicationContext(),"Opss!!\nNão ha o que Limpar!!",Toast.LENGTH_LONG).show();

                            }else{
                                materiaSegundo.setText("");
                                provaSegundo.setText("");
                                trabalhoSegundo.setText("");
                                txtvwMedia.setText("0.0");
                                txtvwsituacao.setText("Indefinido");

                                txtvwMedia.setTextColor(Color.BLACK);
                                txtvwsituacao.setTextColor(Color.BLACK);


                                materiaSegundo.requestFocus();

                                gravar.setEnabled(true);
                                limpar.setEnabled(false);

                                Toast.makeText(getApplicationContext(),"Todos os Campos Estão Limpos!!",Toast.LENGTH_LONG).show();

                            }


                        }catch (Exception Erro){
                            Toast.makeText(getApplicationContext(),Erro.getMessage(),Toast.LENGTH_LONG).show();
                        }



                    }
        });

    }
    //SALVAR OS DADOS EM XML ATRAVES DO METODOS SharesPreferences
    private void Salvar_SharedPrefences(){

        SharedPreferences mediaEscolarPref =
                getSharedPreferences(MainActivity.NOME_SHARED_PREFENCES,0);

        SharedPreferences.Editor segundoBim = mediaEscolarPref.edit();


        segundoBim.putString("Materia segundo",materiaSegundo.getText().toString());
        segundoBim.putString("nota Prova segundo",String.valueOf(notaProvaSeg));
        segundoBim.putString("nota Trabalho segundo",String.valueOf(notaTrabalhoSeg));
        segundoBim.putString("situacao Final segundo",txtvwsituacao.getText().toString());
        segundoBim.putString("media final segundo",String.valueOf(media));
        segundoBim.putBoolean("Segundo Bimestre",true);

        segundoBim.commit();



    }
}