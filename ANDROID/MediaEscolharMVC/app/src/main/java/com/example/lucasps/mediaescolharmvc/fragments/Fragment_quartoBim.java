package com.example.lucasps.mediaescolharmvc.fragments;

import android.content.Context;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.lucasps.mediaescolharmvc.R;
import com.example.lucasps.mediaescolharmvc.controller.MediaEscolarController;
import com.example.lucasps.mediaescolharmvc.model.MediaEscolar;
import com.example.lucasps.mediaescolharmvc.view.MainActivity;

public class Fragment_quartoBim extends Fragment {

    View view;

    Button calcular,limpar,salvar;

    EditText materiaQuarto;
    EditText provaQuarto;
    EditText trabalhoQuarto;

    TextView txtvwMedia;
    TextView txtvwsituacao;


    Double notaProvaQuarto;
    Double notaTrabalhoQuarto;
    Double media;

    Context contexto;

    boolean DadosValidados = true;

    MediaEscolar mediaEscolar;
    MediaEscolarController controller;

    public Fragment_quartoBim() {

    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

    }
    @Override
    public View onCreateView(LayoutInflater inflater, final ViewGroup container,
                             Bundle savedInstanceState) {
        view =  inflater.inflate(R.layout.fragment_quarto_bim, container, false);

        contexto = getContext();

        calcular = view.findViewById(R.id.btn_QuartoBimCalcularID);
        limpar = view.findViewById(R.id.btn_QuartoBimLimparID);
        salvar = view.findViewById(R.id.btn_QuartorBimSalvarID);

        materiaQuarto = view.findViewById(R.id.edtxt_materiaQuartoBimID);
        provaQuarto = view.findViewById(R.id.edtxt_provaQuartoBimID);
        trabalhoQuarto = view.findViewById(R.id.edtxt_trabalQuartoBimID);

        txtvwMedia = view.findViewById(R.id.txtvw_mediaQuartoFinalID);
        txtvwsituacao = view.findViewById(R.id.txtvw_resultadoQuartoFinalID);

        salvar.setEnabled(false);

        //CALCULAR
        calcular.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                DadosValidados = true;

                if (trabalhoQuarto.getText().toString().isEmpty()) {
                    trabalhoQuarto.requestFocus();
                    trabalhoQuarto.setError("Obrigatorio");
                    DadosValidados = false;

                }
                else if (provaQuarto.getText().toString().isEmpty()) {

                    provaQuarto.setError("Obrigatorio");
                    provaQuarto.requestFocus();
                    DadosValidados = false;

                }
                else if (materiaQuarto.getText().toString().isEmpty()) {
                    materiaQuarto.requestFocus();
                    materiaQuarto.setError("Obrigatorio");
                    DadosValidados = false;

                }
                else if (Double.parseDouble(trabalhoQuarto.getText().toString())>10){
                    trabalhoQuarto.requestFocus();
                    trabalhoQuarto.setError("*");
                    DadosValidados = false;
                    Toast.makeText(contexto, "Nota ACIMA do Permitido, MAXIMO--> 10.00", Toast.LENGTH_LONG).show();
                }
                else if (Double.parseDouble(provaQuarto.getText().toString())>10){
                    provaQuarto.requestFocus();
                    provaQuarto.setError("*");
                    DadosValidados = false;
                    Toast.makeText(contexto, "Nota ACIMA do Permitido, MAXIMO--> 10.00", Toast.LENGTH_LONG).show();
                }
                else {
                    if (DadosValidados) {

                        mediaEscolar = new MediaEscolar();
                        controller = new MediaEscolarController(contexto);

                        mediaEscolar.setMateria(materiaQuarto.getText().toString());
                        mediaEscolar.setNotaProva(Double.parseDouble(provaQuarto.getText().toString()));
                        mediaEscolar.setNotaTrabalho(Double.parseDouble(trabalhoQuarto.getText().toString()));
                        mediaEscolar.setBimestre("4º Bimestre");

                        media = controller.calcularMedia(mediaEscolar);

                        mediaEscolar.setMediaFinal(media);
                        mediaEscolar.setSituacao(controller.resultadoFinal(media));


                        txtvwMedia.setText(MainActivity.formatarDecimal(media));

                        //aprovado
                        if (media >= 6) {
                            txtvwsituacao.setText(mediaEscolar.getSituacao());
                            txtvwsituacao.setTextColor(Color.BLUE);
                            txtvwMedia.setTextColor(Color.BLUE);

                            salvar.setEnabled(true);

                        }
                        //recuperação
                        else if(media >=4 && media<5.9){
                            txtvwsituacao.setText(mediaEscolar.getSituacao());
                            txtvwsituacao.setTextColor(Color.parseColor("#FF8000"));
                            txtvwMedia.setTextColor(Color.parseColor("#FF8000"));

                            salvar.setEnabled(true);

                        }
                        //reprovado
                        else if (media < 4)
                        {
                            txtvwsituacao.setText(mediaEscolar.getSituacao());
                            txtvwsituacao.setTextColor(Color.RED);
                            txtvwMedia.setTextColor(Color.RED);

                            salvar.setEnabled(true);
                        }
                        else if (media > 10) {
                            txtvwsituacao.setTextColor(Color.MAGENTA);
                            txtvwsituacao.setText("xXx");
                            txtvwMedia.setText(":{");
                            Toast.makeText(contexto, "Media Acima de 10,0...\nFavor REVISAR os valores Informados", Toast.LENGTH_LONG).show();
                        }
                        notaTrabalhoQuarto = Double.parseDouble(trabalhoQuarto.getText().toString());
                        notaProvaQuarto = Double.parseDouble(provaQuarto.getText().toString());

                        provaQuarto.setText(MainActivity.formatarDecimal(notaProvaQuarto));
                        trabalhoQuarto.setText(MainActivity.formatarDecimal(notaTrabalhoQuarto));


                    }else Toast.makeText(contexto,"Nota ACIMA do Permitido, MAXIMO--> 10.00", Toast.LENGTH_LONG).show();
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

                        calcular.setEnabled(true);


                        Toast.makeText(contexto,"Opss!!\nNão ha o que Limpar!!",Toast.LENGTH_LONG).show();

                    }else{
                        materiaQuarto.setText("");
                        provaQuarto.setText("");
                        trabalhoQuarto.setText("");
                        txtvwMedia.setText("0.0");
                        txtvwsituacao.setText("Indefinido");

                        txtvwMedia.setTextColor(Color.BLACK);
                        txtvwsituacao.setTextColor(Color.BLACK);


                        materiaQuarto.requestFocus();

                        calcular.setEnabled(true);
                        Toast.makeText(contexto,"Todos os Campos Estão Limpos!!",Toast.LENGTH_LONG).show();

                    }


                }catch (Exception Erro){
                    Toast.makeText(contexto,Erro.getMessage(),Toast.LENGTH_LONG).show();
                }



            }
        });

        //SALVAR DADOS NO BANCO DE DADOS
        salvar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    if ((materiaQuarto.getText().length() != 0) && (provaQuarto.getText().length() != 0) && (trabalhoQuarto.getText().length() != 0)) {
                        if (controller.salvar(mediaEscolar)) {
                            //Salva os dados no DB
                            calcular.setEnabled(false);
                            limpar.setEnabled(false);
                            salvar.setEnabled(false);
                            Toast.makeText(contexto, "Dados salvos com Sucesso!!..", Toast.LENGTH_SHORT).show();
                        } else {
                            //não salva os dados no DB
                            Toast.makeText(contexto, "Erro ao tentas Salvar os dados no DB!!...", Toast.LENGTH_SHORT).show();
                        }
                    } else {
                        Toast.makeText(contexto, "Impossivel Gravar, Dados Faltando", Toast.LENGTH_SHORT).show();
                    }
                } catch (Exception erro) {
                    Toast.makeText(getContext(), erro.getMessage(), Toast.LENGTH_SHORT).show();
                }
            }


        });


        return view;
    }
}
