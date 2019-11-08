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

public class QuartoBimActivity extends AppCompatActivity {

    Button gravar,limpar;

    EditText materiaQuarto;
    EditText provaQuarto;
    EditText trabalhoQuarto;

    TextView txtvwMedia;
    TextView txtvwsituacao;


    Double notaProvaQuarto;
    Double notaTrabalhoQuarto;
    Double media;

    boolean DadosValidados = true;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_quarto_bim);//mudar para outro layout

        gravar=findViewById(R.id.btn_QuartoBimGravarID);
        limpar=findViewById(R.id.btn_QuartoBimLimparID);
        materiaQuarto=findViewById(R.id.edtxt_materiaQuartoBimID);
        provaQuarto=findViewById(R.id.edtxt_provaQuartoBimID);
        trabalhoQuarto=findViewById(R.id.edtxt_trabalQuartoBimID);
        txtvwMedia=findViewById(R.id.txtvw_mediaQuartoFinalID);
        txtvwsituacao =findViewById(R.id.txtvw_resultadoQuartoFinalID);

        //GRAVAR
        gravar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    //pegar variaveis STRING e convertendo para DOUBlE
                    notaProvaQuarto = Double.parseDouble(provaQuarto.getText().toString());
                    notaTrabalhoQuarto = Double.parseDouble(trabalhoQuarto.getText().toString());

                    DadosValidados = true;

                    if (trabalhoQuarto.getText().toString().isEmpty()) {
                        trabalhoQuarto.requestFocus();
                        trabalhoQuarto.setError("*");
                        DadosValidados = false;

                        Toast.makeText(getApplicationContext(), "Campo Nota TRABALHO é Obrigatorio", Toast.LENGTH_LONG).show();
                    }
                    if (provaQuarto.getText().toString().isEmpty()) {

                        provaQuarto.setError("*");
                        provaQuarto.requestFocus();
                        DadosValidados = false;
                        Toast.makeText(getApplicationContext(), "Campo Nota PROVA é Obrigatorio", Toast.LENGTH_LONG).show();
                    }
                    if (materiaQuarto.getText().toString().isEmpty()) {
                        materiaQuarto.requestFocus();
                        materiaQuarto.setError("*");
                        DadosValidados = false;
                        Toast.makeText(getApplicationContext(), "Campo MATERIA é Obrigatorio", Toast.LENGTH_LONG).show();
                    }
                    if (notaTrabalhoQuarto>10){
                        trabalhoQuarto.requestFocus();
                        trabalhoQuarto.setError("*");
                        DadosValidados = false;
                        Toast.makeText(getApplicationContext(), "Nota ACIMA do Permitido, MAXIMO--> 10.00", Toast.LENGTH_LONG).show();
                    }if (notaTrabalhoQuarto>10){
                        provaQuarto.requestFocus();
                        provaQuarto.setError("*");
                        DadosValidados = false;
                        Toast.makeText(getApplicationContext(), "Nota ACIMA do Permitido, MAXIMO--> 10.00", Toast.LENGTH_LONG).show();
                    }
                    else {
                        if (DadosValidados) {

                            media = (notaProvaQuarto + notaTrabalhoQuarto) / 2;
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

                            provaQuarto.setText(MainActivity.formatarDecimal(notaTrabalhoQuarto));
                            trabalhoQuarto.setText(MainActivity.formatarDecimal(notaTrabalhoQuarto));


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
                    if ((materiaQuarto.getText().toString().length()==0)&&
                            (provaQuarto.getText().toString().length()==0)&&
                            (trabalhoQuarto.getText().toString().length()==0)){

                        gravar.setEnabled(true);


                        Toast.makeText(getApplicationContext(),"Opss!!\nNão ha o que Limpar!!",Toast.LENGTH_LONG).show();

                    }else{
                        materiaQuarto.setText("");
                        provaQuarto.setText("");
                        trabalhoQuarto.setText("");
                        txtvwMedia.setText("0.0");
                        txtvwsituacao.setText("Indefinido");

                        txtvwMedia.setTextColor(Color.BLACK);
                        txtvwsituacao.setTextColor(Color.BLACK);


                        materiaQuarto.requestFocus();

                        gravar.setEnabled(true);
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

        SharedPreferences mediaEscolarPref=
                getSharedPreferences(MainActivity.NOME_SHARED_PREFENCES,0);

        SharedPreferences.Editor QuartoBimestre = mediaEscolarPref.edit();

        QuartoBimestre.putString("Materia quarto",materiaQuarto.getText().toString());
        QuartoBimestre.putString("nota Prova quarto",String.valueOf(notaProvaQuarto));
        QuartoBimestre.putString("nota Trabalho quarto",String.valueOf(notaTrabalhoQuarto));
        QuartoBimestre.putString("situacao Final quarto",txtvwsituacao.getText().toString());
        QuartoBimestre.putString("media final quarto",String.valueOf(media));
        QuartoBimestre.putBoolean("Quarto Bimestre",true);

        QuartoBimestre.commit();
    }

}