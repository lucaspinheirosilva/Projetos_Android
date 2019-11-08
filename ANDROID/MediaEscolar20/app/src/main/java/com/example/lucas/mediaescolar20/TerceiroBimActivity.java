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

public class TerceiroBimActivity extends AppCompatActivity {

    Button gravar,limpar;

    EditText materiaTerceiro;
    EditText provaTerceiro;
    EditText trabalhoTerceiro;

    TextView txtvwMedia;
    TextView txtvwsituacao;


    Double notaProvaTerc;
    Double notaTrabalhoTerc;
    Double media;

    boolean DadosValidados = true;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_terceiro_bim);//mudar para outro layout

        gravar=findViewById(R.id.btn_TerceiroBimGravarID);
        limpar=findViewById(R.id.btn_TerceiroBimLimparID);
        materiaTerceiro=findViewById(R.id.edtxt_materiaTerceiroBimID);
        provaTerceiro=findViewById(R.id.edtxt_provaTerceiroBimID);
        trabalhoTerceiro=findViewById(R.id.edtxt_trabalTerceiroBimID);
        txtvwMedia=findViewById(R.id.txtvw_mediaTerceiroFinalID);
        txtvwsituacao =findViewById(R.id.txtvw_resultadoTerceiroFinalID);

        //GRAVAR
        gravar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    //pegar variaveis STRING e convertendo para DOUBlE
                    notaProvaTerc = Double.parseDouble(provaTerceiro.getText().toString());
                    notaTrabalhoTerc = Double.parseDouble(trabalhoTerceiro.getText().toString());

                    DadosValidados = true;

                    if (trabalhoTerceiro.getText().toString().isEmpty()) {
                        trabalhoTerceiro.requestFocus();
                        trabalhoTerceiro.setError("*");
                        DadosValidados = false;

                        Toast.makeText(getApplicationContext(), "Campo Nota TRABALHO é Obrigatorio", Toast.LENGTH_LONG).show();
                    }
                    if (provaTerceiro.getText().toString().isEmpty()) {

                        provaTerceiro.setError("*");
                        provaTerceiro.requestFocus();
                        DadosValidados = false;
                        Toast.makeText(getApplicationContext(), "Campo Nota PROVA é Obrigatorio", Toast.LENGTH_LONG).show();
                    }
                    if (materiaTerceiro.getText().toString().isEmpty()) {
                        materiaTerceiro.requestFocus();
                        materiaTerceiro.setError("*");
                        DadosValidados = false;
                        Toast.makeText(getApplicationContext(), "Campo MATERIA é Obrigatorio", Toast.LENGTH_LONG).show();
                    }
                    if (notaTrabalhoTerc>10){
                        trabalhoTerceiro.requestFocus();
                        trabalhoTerceiro.setError("*");
                        DadosValidados = false;
                        Toast.makeText(getApplicationContext(), "Nota ACIMA do Permitido, MAXIMO--> 10.00", Toast.LENGTH_LONG).show();
                    }if (notaTrabalhoTerc>10){
                        provaTerceiro.requestFocus();
                        provaTerceiro.setError("*");
                        DadosValidados = false;
                        Toast.makeText(getApplicationContext(), "Nota ACIMA do Permitido, MAXIMO--> 10.00", Toast.LENGTH_LONG).show();
                    }
                    else {
                        if (DadosValidados) {

                            media = (notaProvaTerc + notaTrabalhoTerc) / 2;
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

                            provaTerceiro.setText(MainActivity.formatarDecimal(notaTrabalhoTerc));
                            trabalhoTerceiro.setText(MainActivity.formatarDecimal(notaTrabalhoTerc));


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
                    if ((materiaTerceiro.getText().toString().length()==0)&&
                            (provaTerceiro.getText().toString().length()==0)&&
                            (trabalhoTerceiro.getText().toString().length()==0)){

                        gravar.setEnabled(true);
                        Toast.makeText(getApplicationContext(),"Opss!!\nNão ha o que Limpar!!",Toast.LENGTH_LONG).show();

                    }else{
                        materiaTerceiro.setText("");
                        provaTerceiro.setText("");
                        trabalhoTerceiro.setText("");
                        txtvwMedia.setText("0.0");
                        txtvwsituacao.setText("Indefinido");

                        txtvwMedia.setTextColor(Color.BLACK);
                        txtvwsituacao.setTextColor(Color.BLACK);


                        materiaTerceiro.requestFocus();
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
        SharedPreferences mediaEscolarPref =
                getSharedPreferences(MainActivity.NOME_SHARED_PREFENCES,0);

        SharedPreferences.Editor terceiroBimestre = mediaEscolarPref.edit();

        terceiroBimestre.putString("Materia terceiro",materiaTerceiro.getText().toString());
        terceiroBimestre.putString("nota Prova terceiro",String.valueOf(notaProvaTerc));
        terceiroBimestre.putString("nota Trabalho terceiro",String.valueOf(notaTrabalhoTerc));
        terceiroBimestre.putString("situacao Final terceiro",txtvwsituacao.getText().toString());
        terceiroBimestre.putString("media final terceiro",String.valueOf(media));
        terceiroBimestre.putBoolean("Terceiro Bimestre",true);

        terceiroBimestre.commit();
    }

}