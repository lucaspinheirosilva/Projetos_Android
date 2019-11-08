package com.example.envioemail;

import android.content.Intent;
import android.graphics.Typeface;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    Button btn_enviar;
    Button btn_limpar;

    TextView txtvw_email;
    TextView txtvw_assunto;
    TextView txtvw_mensagem;
    TextView txtvw_contadorCaracteres;

    EditText edttxt_Emaildestinatario;
    EditText edttxt_assunto;
    EditText edttxt_mensagem;

    Intent intent;
    String EmailDestinatario;
    String Assunto;
    String Mensagem;


    //DEFINE A PASTA E O NOME DAS FONTS
    String pasta="fonts/";
    String ttf_ConeriaScript = "Demo_ConeriaScript.ttf";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().hide();//sumir com a ActionBar
        setContentView(R.layout.activity_main);

        txtvw_assunto =findViewById(R.id.txtvw_assundoID);
        txtvw_contadorCaracteres= findViewById(R.id.txtvw_contadorCaracteresID);
        txtvw_mensagem = findViewById(R.id.txtvw_mensagemId);
        txtvw_email = findViewById(R.id.txtvw_emailID);

        btn_enviar = findViewById(R.id.btn_EnviarID);
        btn_limpar = findViewById(R.id.btn_limparID);

        edttxt_assunto = findViewById(R.id.edttxt_assuntoId);
        edttxt_Emaildestinatario = findViewById(R.id.edttxt_EmaildestinatarioID);
        edttxt_mensagem = findViewById(R.id.edttxt_mensagemId);


        //DEFINE A FONT DOS TEXTVIEW
        Typeface ttf = Typeface.createFromAsset(getAssets(),pasta+ttf_ConeriaScript);
        txtvw_assunto.setTypeface(ttf);
        txtvw_contadorCaracteres.setTypeface(ttf);
        txtvw_mensagem.setTypeface(ttf);
        txtvw_email.setTypeface(ttf);

        //BOTAO ENVIAR
        btn_enviar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (edttxt_Emaildestinatario.getText().length()!=0){

                    processarFormulario();

                }else{
                    edttxt_Emaildestinatario.requestFocus();
                    edttxt_Emaildestinatario.setError("Campo Obrigatorio!");
                }

            }
        });

        //BOTAO LIMPAR
        btn_limpar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if ((edttxt_Emaildestinatario.getText().toString().length()==0)&&
                        (edttxt_assunto.getText().toString().length()==0)&&
                        (edttxt_mensagem.getText().toString().length()==0)){

                    Toast.makeText(getApplicationContext(), "Campos ja estão Todos Limpos!",
                            Toast.LENGTH_SHORT).show();
                }
                else {
                    limparCampos();
                }
            }
        });

        //CONTADOR DE CARACTERES
        edttxt_mensagem.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

                String numeroCaracteres=String.valueOf(edttxt_mensagem.length());
                txtvw_contadorCaracteres.setText(numeroCaracteres+" caracteres Digitados");
            }

            @Override
            public void afterTextChanged(Editable s) {

            }
        });

    }

    //FUNÇÃO LIMPAR
    public void limparCampos(){
        edttxt_mensagem.setText("");
        edttxt_Emaildestinatario.setText("");
        edttxt_assunto.setText("");
        edttxt_Emaildestinatario.requestFocus();

        Toast.makeText(getApplicationContext(),"Campos Limpos",Toast.LENGTH_SHORT).show();

    }
    //FUNÇÃO DE PROCESSAR OS DADOS DO FORMULARIO
    public void processarFormulario(){
        Mensagem = edttxt_mensagem.getText().toString();
        Assunto = edttxt_assunto.getText().toString();
        EmailDestinatario =edttxt_Emaildestinatario.getText().toString();

        intent = new Intent(Intent.ACTION_SEND);

        intent.putExtra(intent.EXTRA_EMAIL,new String[]{EmailDestinatario});
        intent.putExtra(intent.EXTRA_SUBJECT,Assunto);
        intent.putExtra(intent.EXTRA_TEXT,Mensagem);

        intent.setType("menssage/rfc822");

        startActivity(intent.createChooser(intent,"Selecione o Aplicativo"));


    }
}