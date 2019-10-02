package app02.example.lucas.enviosms;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.telephony.SmsManager;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.github.rtoshiro.util.format.SimpleMaskFormatter;
import com.github.rtoshiro.util.format.text.MaskTextWatcher;

public class MainActivity extends AppCompatActivity {

    EditText mensagemPara;
    EditText telefonePara;
    Button limpar;
    Button enviar;
    TextView contadorCaracteres;

    SmsManager objSmsManeger;//criar o parametro para instanciar posteriosmente

    //cria String para armazenar o valor dos campos
    String SmsPara;
    String MensagemDestinatario;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //RECUPERAR OS IDs DEFINIDOS NO XML
        mensagemPara = findViewById(R.id.edttxt_mensagemID);
        telefonePara = findViewById(R.id.edtxt_DestinatarioID);
        limpar = findViewById(R.id.btn_LimparID);
        enviar = findViewById(R.id.btn_GravarID);
        contadorCaracteres = findViewById(R.id.txtvw_ContadorCaracteresID);
        //FIM DA RECUPERAÇAÕ

        //CONTADOR DE CARACTERES//
        mensagemPara.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }
            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                try {
                    if (mensagemPara.getText().length()==140){
                        contadorCaracteres.setText("Limite MAXIMO de caracteres atingidos!");
                    }
                    else{

                        String numeroCaracteres=String.valueOf(mensagemPara.length());
                        contadorCaracteres.setText(numeroCaracteres+"/140");
                    }
                }catch (Exception erro){
                   Toast.makeText(getApplicationContext(),erro.getMessage(),Toast.LENGTH_LONG).show();
              }
            }

            @Override
            public void afterTextChanged(Editable s) {
                try {
                    //quando é digitado e apagado o contador volta para o estado de origem
                    if (mensagemPara.getText().length()==0){
                        contadorCaracteres.setText("0/140 Caracteres");
                    }
                }


               catch (Exception erro){
                   Toast.makeText(getApplicationContext(),erro.getMessage(),Toast.LENGTH_LONG).show();
               }



            }
        });
        //FIM DO CONTADOR

        //MASCARA DO CAMPO TELEFONE (tem uma dependencia no arquivo BUID.GRADLE(Module:app))
        SimpleMaskFormatter smf = new SimpleMaskFormatter("(NN)NNNNN-NNNN");//cria a instancia da mascara
        MaskTextWatcher mtw = new MaskTextWatcher(telefonePara,smf);
        telefonePara.addTextChangedListener(mtw); //informa para o editText que ele tem uma mascara
        //FIM DA MASCARA


        //LIMPAR CAMPOS
       limpar.setOnClickListener(new View.OnClickListener() {
           @Override
           public void onClick(View v) {
               try {
                   if ((telefonePara.getText().length()==0)&&(mensagemPara.getText().length()==0))
                   {
                       Toast.makeText(getApplicationContext(),"NÃO há o que Limpar",Toast.LENGTH_SHORT).show();
                   }
                   else{
                       telefonePara.setText("");
                       mensagemPara.setText("");
                       contadorCaracteres.setText("0/140 Caracteres");
                       Toast.makeText(getApplicationContext(),"pronto!",Toast.LENGTH_SHORT).show();
                   }

               }catch (Exception erro){
                   Toast.makeText(getApplicationContext(),erro.getMessage(),Toast.LENGTH_SHORT).show();
               }
           }
       });

       //
       enviar.setOnClickListener(new View.OnClickListener() {
           @Override
           public void onClick(View v) {
               SmsPara = telefonePara.getText().toString();
               MensagemDestinatario=mensagemPara.getText().toString();

               try {
                   if (SmsPara.isEmpty()){
                       Toast.makeText(getApplicationContext(),"INFORMAR DESTINATARIO",Toast.LENGTH_LONG).show();
                       telefonePara.setError("Campo Obrigatorio");
                       telefonePara.requestFocus();
                   }
                   if (MensagemDestinatario.isEmpty()){
                       Toast.makeText(getApplicationContext(),"INFORMAR MENSAGEM",Toast.LENGTH_LONG).show();
                       mensagemPara.setError("Campo Obrigatorio");
                       mensagemPara.requestFocus();
                   }
                    else {

                       objSmsManeger = SmsManager.getDefault();// carrega a config padrao
                       objSmsManeger.sendTextMessage(SmsPara, null, MensagemDestinatario, null, null);
                       Toast.makeText(getApplicationContext(), "SMS Enviado", Toast.LENGTH_LONG).show();
                       telefonePara.setText("");
                       mensagemPara.setText("");
                   }
               }catch (Exception erro){
                   Toast.makeText(getApplicationContext(),erro.getMessage(),Toast.LENGTH_LONG).show();
               }


           }
       });


    }

}
