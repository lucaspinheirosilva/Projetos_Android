package br.com.testetypefont;

import android.Manifest;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Environment;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.SeekBar;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {
    // LER ISSO...pode AJUDAR!!!
//http://www.theclub.com.br/restrito/revistas/201208/andr0812.aspx

    ZipManager zipManager = new ZipManager();

    Spinner spinnerTTF;
    Spinner spinnerZIP;

    EditText textoDigitado;
    EditText corFonte;
    EditText tamanhoFonte;

    TextView textoFinal;
    TextView caminhoRoot;
    TextView txtZipadoTerminado;

    SeekBar skbr_TamanhdoFone;

    String nomeZIP;
    String nomeTTF;


    ArrayList<String> ArquivosTTF = new ArrayList<String>();
    ArrayList<String> ArquivosZIP = new ArrayList<String>();

    AlertDialog.Builder builder;
    AlertDialog alertDialog;

    ProgressBar pgsBarZip;
    ProgressBar pgsBarRoundZIP;

    Button BtnDescompZIP;

    String nomeDir = ObterDiretorio() + "/";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            setContentView(R.layout.activity_main);

            //SETANDO COMPONENTES COM SEUS RESPECTIVOS IDs
            spinnerTTF = findViewById(R.id.spnr_listarFontsID);
            spinnerZIP = findViewById(R.id.spner_listarFontsZipadasID);

            textoDigitado = findViewById(R.id.edtxt_textoDigitadoId);
            corFonte = findViewById(R.id.edtxt_corFonteID);

            textoFinal = findViewById(R.id.txtvw_resultadoFinalId);
            txtZipadoTerminado = findViewById(R.id.txtvw_terminoZipadoID);
            caminhoRoot = findViewById(R.id.txtvw_caminhoRootId);

            BtnDescompZIP = findViewById(R.id.tgbtn_DescompactarZipID);

            pgsBarZip = findViewById(R.id.pgbar_ProgressZIPId);
            pgsBarRoundZIP = findViewById(R.id.pgbar_ProgressRoundZIPId);

            skbr_TamanhdoFone = findViewById(R.id.skbr_tamanhoFonteID);

            pgsBarRoundZIP.setVisibility(View.GONE);
            txtZipadoTerminado.setVisibility(View.GONE);

            //TESTE DE API
            if(Build.VERSION.SDK_INT < 23) {//se a API for < 23 ele ja é liberado automaticamento
                caminhoRoot.setText(ObterDiretorio());
                CallAllFunction();


            } else if(checkAndRequestPermission()) {//for igual a true
                caminhoRoot.setText(ObterDiretorio());
                CallAllFunction();
            }

        } catch (Exception erro) {
            builder = new AlertDialog.Builder(this);
            builder.setTitle("OPS!");
            builder.setMessage(erro.getMessage());
            builder.setCancelable(false);
            builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    finishAndRemoveTask();

                }
            });
            alertDialog = builder.create();
            alertDialog.show();
        }

        //PEGA O TEXTO DIGITADO NO EditText E REPLICA NO TextView RESULTADO FINAL
        textoDigitado.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                String txtOnTextchanged = textoDigitado.getText().toString();
                textoFinal.setText(txtOnTextchanged);

            }

            @Override
            public void afterTextChanged(Editable s) {
            }

        });

        //PEGA O VALOR DIGITADO NO EditText DA COR E REPLICA NO TextView RESULTADO FINAL
        corFonte.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {
                //TODO:ARRUMAR O CAMPO DE COR
                /**String corfont = corFonte.getText().toString();
                textoFinal.setTextColor(Integer.parseInt("#" + corfont));*/
            }
        });

        //PEGA O VALOR DIGITADO NO EditText DO TAMANHO DA FONTE E REPLICA NO TextView RESULTADO FINAL
        skbr_TamanhdoFone.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                textoFinal.setTextSize(skbr_TamanhdoFone.getProgress());
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {

            }
        });

        //QUANDO CLICADO NO BOTÃO DESCOMPACTAR....
        BtnDescompZIP.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                pgsBarRoundZIP.setVisibility(View.VISIBLE);//torna visivel a barra circular de progresso
                BtnDescompZIP.setEnabled(false);//desativa o botao de descompactar
                BtnDescompZIP.setText("Descompactando...");//muda o texto do botao de descompactar
                txtZipadoTerminado.setVisibility(View.GONE);//esconte o texto de FEITO.

                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        for (int i = 0; i <= 100; i++) {
                            final int progresso = i;

                            runOnUiThread(new Runnable() {
                                @Override
                                public void run() {
                                    pgsBarZip.setProgress(progresso);

                                    File sd = Environment.getExternalStorageDirectory();
                                    if(sd.canWrite()) {
                                        zipManager.unzip(nomeDir, nomeZIP);//chama a classe ZIPMANAGER e passar o DIRETORIO o o NOME DO ZIP.
                                    }

                                    if(progresso == 100) {
                                        pgsBarRoundZIP.setVisibility(View.GONE);//torna invisivel a barra circular de progresso
                                        BtnDescompZIP.setEnabled(true);//ativa o botao de descompactar
                                        txtZipadoTerminado.setVisibility(View.VISIBLE);
                                        BtnDescompZIP.setText("DESCOMPACTAR");
                                        CallAllFunction();
                                    }
                                }
                            });
                            try {
                                Thread.sleep(5);
                            } catch (InterruptedException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                }).start();
            }
        });
    }


    @Override
    //RECARREGA OS SPINNER QUANDO MUDA A PILHA DE ACTIVITY
    protected void onResume() {
        super.onResume();
        CallAllFunction();
        Toast.makeText(getApplicationContext(),"Spinner ATUALIZADO",Toast.LENGTH_SHORT).show();
    }

    //AGLOMERADO DE FUNÇOES QUE FAZER NO EVENTO OnCreate();
    public void CallAllFunction() {
        ListarArquivosTTF();
        ListarArquivosZIP();
    }

    //OBTEM O DIRETORIO Downloads
    public String ObterDiretorio() {
        File root = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
        return root.toString();
    }

    //LISTA OS ARQUIVOS COM EXTENSÃO TTF NO DIRETORIO DOWNLOADS
    public void ListarArquivosTTF() {
        /**
         * O método Listar() preencherá o componente Spinner com os arquivos do tipo “.ttf” salvos no diretório externo.
         * Usamos os tipos de variáveis File e File[], sendo respectivamente responsáveis por obter o diretório e os arquivos
         * deste diretório. Adicionamos os arquivos em um “Array” para posteriormente utilizá-los.
         */

        File diretorio = new File(ObterDiretorio());
        File[] arquivos = diretorio.listFiles();

        ArquivosTTF.clear();//semple limpa o array para nao ficar populando o spinner
        if(arquivos != null) {

            for (int i = 0; i < arquivos.length; i++) {
                File f = arquivos[i];
                if(f.isFile()) {

                    if((f.getName().contains(".ttf")) || (f.getName().contains(".otf"))) {
                        ArquivosTTF.add(f.getName());
                    }
                }
            }

            ArrayAdapter<String> arrayAdapterTTF = new ArrayAdapter<String>(//Preenche o spinner com as informaçoes
                    this, R.layout.support_simple_spinner_dropdown_item, ArquivosTTF);
            spinnerTTF.setAdapter(arrayAdapterTTF);

            spinnerTTF.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                //EVENTO DE CLICK DO SPINNER PEGANDO O ITEM CLICADO
                @Override
                public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {

                    nomeTTF = parent.getItemAtPosition(position).toString();//atribui a variavel o nome do arquivo clicado

                    try {
                        Typeface ttf = Typeface.createFromFile(nomeDir + nomeTTF);
                        textoFinal.setTypeface(ttf);
                    } catch (Exception erro) {
                        Toast.makeText(getBaseContext(), erro.getMessage(), Toast.LENGTH_LONG).show();
                    }


                }

                @Override
                public void onNothingSelected(AdapterView<?> parent) {

                }
            });

        }

    }

    //LISTA OS ARQUIVOS COM EXTENSÃO ZIP NO DIRETORIO DOWNLOADS
    public void ListarArquivosZIP() {
        File diretorioZip = new File(ObterDiretorio());
        File[] arquivosZip = diretorioZip.listFiles();

        ArquivosZIP.clear();//semple limpa o array para nao ficar populando o spinner
        if(arquivosZip != null) {
            for (int i = 0; i < arquivosZip.length; i++) {
                File fZip = arquivosZip[i];
                if(fZip.isFile()) {

                    if((fZip.getName().contains(".zip")) || (fZip.getName().contains(".rar"))) {
                        ArquivosZIP.add(fZip.getName());
                    }
                }
            }

            ArrayAdapter<String> arrayAdapterZIP = new ArrayAdapter<String>(
                    this, R.layout.support_simple_spinner_dropdown_item, ArquivosZIP);
            spinnerZIP.setAdapter(arrayAdapterZIP);

            spinnerZIP.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {

                @Override
                public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {

                    nomeZIP = parent.getItemAtPosition(position).toString();


                }

                @Override
                public void onNothingSelected(AdapterView<?> parent) {

                }
            });

        }

    }


    private boolean checkAndRequestPermission() {

        boolean retorno = true;

        List<String> permissaoNecessaria = new ArrayList<>();

        int permissaoLerStorage = ContextCompat.checkSelfPermission(
                this, Manifest.permission.READ_EXTERNAL_STORAGE);
        int permissaoEscreverStorage = ContextCompat.checkSelfPermission(
                this, Manifest.permission.WRITE_EXTERNAL_STORAGE);

        //-1 negado
        // 0 permitido

        if(permissaoLerStorage != PackageManager.PERMISSION_GRANTED) {
            permissaoNecessaria.add(Manifest.permission.READ_EXTERNAL_STORAGE);
        }
        if(permissaoEscreverStorage != PackageManager.PERMISSION_GRANTED) {
            permissaoNecessaria.add(Manifest.permission.WRITE_EXTERNAL_STORAGE);
        }
        if(!permissaoNecessaria.isEmpty()) {
            ActivityCompat.requestPermissions(this, permissaoNecessaria.toArray(new String[permissaoNecessaria.size()]), 1);
            retorno = false;

        }
        return retorno;
    }

    @Override
    public void onRequestPermissionsResult(int requestCode,
                                           String permissions[],
                                           int[] grantResults) {
        switch (requestCode) {
            case 1: {

                if(grantResults.length > 0
                        && grantResults[0] == PackageManager.PERMISSION_GRANTED) {

                    if(ContextCompat.checkSelfPermission(
                            this, Manifest.permission.READ_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED) {

                        caminhoRoot.setText(ObterDiretorio());
                        CallAllFunction();

                    }
                } else {

                    builder = new AlertDialog.Builder(this);
                    builder.setTitle("OPS!");
                    builder.setMessage("Impossivel abrir...voce nao concedeu permissão ao aplicativo para ler o diretorio especifico");
                    builder.setCancelable(false);
                    builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {

                            finishAndRemoveTask();

                        }
                    });
                    alertDialog = builder.create();
                    alertDialog.show();
                }
                return;

            }

            case 2: {

                if(grantResults.length > 0
                        && grantResults[0] == PackageManager.PERMISSION_GRANTED) {

                    if(ContextCompat.checkSelfPermission(
                            this, Manifest.permission.WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED) {

                        caminhoRoot.setText(ObterDiretorio());
                        CallAllFunction();

                    }
                } else {

                    builder = new AlertDialog.Builder(this);
                    builder.setTitle("OPS!");
                    builder.setMessage("Impossivel abrir...voce nao concedeu permissão ao aplicativo para ler o diretorio especifico");
                    builder.setCancelable(false);
                    builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {

                            finishAndRemoveTask();

                        }
                    });
                    alertDialog = builder.create();
                    alertDialog.show();
                }
                return;
            }


        }
    }


}

