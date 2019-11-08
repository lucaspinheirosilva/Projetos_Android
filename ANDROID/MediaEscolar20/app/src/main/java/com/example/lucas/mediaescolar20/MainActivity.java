package com.example.lucas.mediaescolar20;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Button;
import android.widget.Toast;

import java.text.DecimalFormat;

public class MainActivity extends AppCompatActivity {


    Button PrimeiroBim,SegundoBim,TerceiroBim,QuartoBim,ResultadoFinal;

      //Status MENU..ATIVADO ou DESATIVADO
    Boolean Primero,Segundo,Terceiro,Quarto;

    //Campos a serem preenchido pelo SharedPreferences
    String SituacaoFinalPrimeiroBim,MateriaPrimeiroBim;
    double TrabalhoPrimeiroBim,MediaPrimeiroBim,ProvaPrimeiroBim;


    String SituacaoFinalSegundoBim,MateriaSegundoBim;
    double ProvaSegundoBim,TrabalhoSegundoBim,MediaSegundoBim;


    String SituacaoFinalTerceiroBim,MateriaTerceiroBim;
    double ProvaTerceiroBim,TrabalhoTerceiroBim,MediaTerceiroBim;


    String SituacaoFinalQuartoBim,MateriaQuartoBim;
    double ProvaQuartoBim,TrabalhoQuartoBim,MediaQuartoBim;

    double MediaFinal;

    public static final String NOME_SHARED_PREFENCES= "Media_Escolar_Pref";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);



        //recuperar os IDs
        PrimeiroBim=findViewById(R.id.btn_primeiroBimestreID);
        SegundoBim=findViewById(R.id.btn_segundoBimestreID);
        TerceiroBim=findViewById(R.id.btn_terceiroBimestreID);
        QuartoBim=findViewById(R.id.btn_quartoBimestreID);
        ResultadoFinal=findViewById(R.id.btn_resultadoFinalID);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Tudo Limpo", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();

                limparSharedPreferences();
            }
        });
        PrimeiroBim.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent chamarPrimeiroBim = new Intent(MainActivity.this,PrimeiroBimActivity.class);
                startActivity(chamarPrimeiroBim);
            }
        });
        SegundoBim.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent chamarSegundoBim = new Intent(MainActivity.this,SegundoBimActivity.class);
                startActivity(chamarSegundoBim);
            }
        });
        TerceiroBim.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent chamarTerceiroBim = new Intent(MainActivity.this,TerceiroBimActivity.class);
                startActivity(chamarTerceiroBim);
            }
        });
        QuartoBim.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent chamarQuartoBim = new Intent(MainActivity.this,QuartoBimActivity.class);
                startActivity(chamarQuartoBim);
            }
        });
    }

    @Override
    public void onStart(){
        super.onStart();
    }

    @Override
    public void onResume(){
        super.onResume();

        lerSharedPreferences();
        visualizarResultado();
    }

    @Override
    public void onStop(){
        super.onStop();
    }
    @Override
    public void onPause(){
        super.onPause();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            Toast.makeText(getApplicationContext(),"Aplicativo Finalizado",Toast.LENGTH_LONG).show();
            finish();
        }

        return super.onOptionsItemSelected(item);
    }


    public void lerSharedPreferences(){

        SharedPreferences mediaEscolarPref =
                getSharedPreferences(NOME_SHARED_PREFENCES,0);


        //Ler Primeiro Bimestre
        Primero = mediaEscolarPref.getBoolean("Primeiro Bimestre",false);
        MateriaPrimeiroBim = mediaEscolarPref.getString("Materia primeiro","");
        SituacaoFinalPrimeiroBim = mediaEscolarPref.getString("situacao Final primeiro","");
        ProvaPrimeiroBim = Double.parseDouble(mediaEscolarPref.getString("nota Prova primeiro","0.0"));
        TrabalhoPrimeiroBim = Double.parseDouble(mediaEscolarPref.getString("nota Trabalho primeiro","0.0"));
        MediaPrimeiroBim = Double.parseDouble(mediaEscolarPref.getString("media final primeiro","0.0"));

        //Ler Segundo Bimestre
        Segundo= mediaEscolarPref.getBoolean("Segundo Bimestre",false);
        MateriaSegundoBim = mediaEscolarPref.getString("Materia segundo","");
        SituacaoFinalSegundoBim = mediaEscolarPref.getString("situacao Final segundo","");
        ProvaSegundoBim = Double.parseDouble(mediaEscolarPref.getString("nota Prova segundo","0.0"));
        TrabalhoSegundoBim = Double.parseDouble(mediaEscolarPref.getString("nota Trabalho segundo","0.0"));
        MediaSegundoBim = Double.parseDouble(mediaEscolarPref.getString("media final segundo","0.0"));

        //Ler Terceiro Bimestre
        Terceiro = mediaEscolarPref.getBoolean("Terceiro Bimestre",false);
        MateriaTerceiroBim = mediaEscolarPref.getString("Materia terceiro","");
        SituacaoFinalTerceiroBim = mediaEscolarPref.getString("situacao Final terceiro","");
        ProvaTerceiroBim = Double.parseDouble(mediaEscolarPref.getString("nota Prova terceiro","0.0"));
        TrabalhoTerceiroBim = Double.parseDouble(mediaEscolarPref.getString("nota Trabalho terceiro","0.0"));
        MediaTerceiroBim = Double.parseDouble(mediaEscolarPref.getString("media final terceiro","0.0"));

        //Ler Quarto Bimestre
        Quarto = mediaEscolarPref.getBoolean("Quarto Bimestre",false);
        MateriaQuartoBim = mediaEscolarPref.getString("Materia quarto","");
        SituacaoFinalQuartoBim = mediaEscolarPref.getString("situacao Final quarto","");
        ProvaQuartoBim = Double.parseDouble(mediaEscolarPref.getString("nota Prova quarto","0.0"));
        TrabalhoQuartoBim = Double.parseDouble(mediaEscolarPref.getString("nota Trabalho quarto","0.0"));
        MediaQuartoBim = Double.parseDouble(mediaEscolarPref.getString("media final quarto","0.0"));




    }

    public void limparSharedPreferences(){
        SharedPreferences mediaEscolarPref = getSharedPreferences(NOME_SHARED_PREFENCES,0);
        SharedPreferences.Editor editor = mediaEscolarPref.edit();

        editor.clear();
        editor.commit();

        limparMenu();



    }

    public static String formatarDecimal(Double valor){
        DecimalFormat df = new DecimalFormat("#,###,##0.00");
        return df.format(valor);
    }

    private void visualizarResultado(){
        if (Primero){
            PrimeiroBim.setText(MateriaPrimeiroBim+"-- 1ºBIMESTRE--"+ SituacaoFinalPrimeiroBim+"--NOTA "+formatarDecimal(MediaPrimeiroBim));
            PrimeiroBim.setEnabled(false);
            SegundoBim.setEnabled(true);
        }
        if (Segundo){
            SegundoBim.setText(MateriaSegundoBim+"-- 2º-BIMESTRE--"+SituacaoFinalSegundoBim+"--NOTA "+formatarDecimal(MediaSegundoBim));
            SegundoBim.setEnabled(false);
            TerceiroBim.setEnabled(true);
        }
        if (Terceiro){
            TerceiroBim.setText(MateriaTerceiroBim+"-- 3ºBIMESTRE--"+ SituacaoFinalTerceiroBim+"--NOTA "+formatarDecimal(MediaTerceiroBim));
            TerceiroBim.setEnabled(false);
            QuartoBim.setEnabled(true);
            int x=0;
        }
        if (Quarto){
            QuartoBim.setText(MateriaQuartoBim+"-- 4ºBIMESTRE--"+ SituacaoFinalQuartoBim+"--NOTA "+formatarDecimal(MediaQuartoBim));
            QuartoBim.setEnabled(false);
            ResultadoFinal.setEnabled(true);

            MediaFinal = 0;
            MediaFinal += MediaPrimeiroBim;
            MediaFinal += MediaSegundoBim;
            MediaFinal += MediaTerceiroBim;
            MediaFinal += MediaQuartoBim;

            String mensagemFinal ="";

            MediaFinal = (MediaFinal/4);

            if ((MediaPrimeiroBim>=6)&&(MediaSegundoBim>=6)&&(MediaTerceiroBim>=6)&&(MediaQuartoBim>=6)){

                mensagemFinal="APROVADO com a Media Final "+MediaFinal;
            }
            else{
                mensagemFinal="REPROVADO com a Media Final "+MediaFinal;
            }

            ResultadoFinal.setText(mensagemFinal);







        }
    }

    private void limparMenu(){
        PrimeiroBim.setText("PRIMEIRO BIMESTRE");
        SegundoBim.setText("SEGUNDO BIMESTRE");
        TerceiroBim.setText("TERCEIRO BIMESTRE");
        QuartoBim.setText("QUARTO BIMESTRE");
        ResultadoFinal.setText("RESULTADO FINAL");

        PrimeiroBim.setEnabled(true);
        SegundoBim.setEnabled(false);
        TerceiroBim.setEnabled(false);
        QuartoBim.setEnabled(false);
        ResultadoFinal.setEnabled(false);
    }
}
