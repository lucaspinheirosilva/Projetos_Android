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

public class Fragment_segundoBim extends Fragment {

    View view;

    Button calcular,limpar,salvar;

    EditText materiaSegundo;
    EditText provaSegundo;
    EditText trabalhoSegundo;

    TextView txtvwMedia;
    TextView txtvwsituacao;

    Double notaProvaSeg;
    Double notaTrabalhoSeg;
    Double media;

    Context contexto;

    boolean DadosValidados = true;

    MediaEscolar mediaEscolar;
    MediaEscolarController controller;

    public Fragment_segundoBim() {

    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

    }
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        view =  inflater.inflate(R.layout.fragment_segundo_bim, container, false);

        contexto = getContext();

        calcular =view.findViewById(R.id.btn_SegundoBimCalcularID);
        limpar=view.findViewById(R.id.btn_SegundoBimLimparID);
        salvar = view.findViewById(R.id.btn_SegundoBimSalvarID);

        materiaSegundo=view.findViewById(R.id.edtxt_materiaSegundoBimID);
        provaSegundo=view.findViewById(R.id.edtxt_provaSegundoBimID);
        trabalhoSegundo=view.findViewById(R.id.edtxt_trabalSegundoBimID);

        txtvwMedia=view.findViewById(R.id.txtvw_mediaSegundoFinalID);
        txtvwsituacao=view.findViewById(R.id.txtvw_resultadoSegundoFinalID);

        salvar.setEnabled(false);

        //CALCULAR
        calcular.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                    DadosValidados = true;

                    if (trabalhoSegundo.getText().toString().isEmpty()) {
                        trabalhoSegundo.requestFocus();
                        trabalhoSegundo.setError("Obrigatorio");
                        DadosValidados = false;
                    }
                    else if (provaSegundo.getText().toString().isEmpty()) {

                        provaSegundo.setError("Obrigatorio");
                        provaSegundo.requestFocus();
                        DadosValidados = false;

                    }
                   else if (materiaSegundo.getText().toString().isEmpty()) {
                        materiaSegundo.requestFocus();
                        materiaSegundo.setError("Obrigatorio");
                        DadosValidados = false;

                    }
                     else if (Double.parseDouble(trabalhoSegundo.getText().toString())>10){
                        trabalhoSegundo.requestFocus();
                        trabalhoSegundo.setError("*");
                        DadosValidados = false;
                        Toast.makeText(contexto, "Nota ACIMA do Permitido, MAXIMO--> 10.00", Toast.LENGTH_LONG).show();
                    }
                    else if (Double.parseDouble(trabalhoSegundo.getText().toString())>10){
                        provaSegundo.requestFocus();
                        provaSegundo.setError("*");
                        DadosValidados = false;
                        Toast.makeText(contexto, "Nota ACIMA do Permitido, MAXIMO--> 10.00", Toast.LENGTH_LONG).show();
                    }
                    else {
                        if (DadosValidados) {

                            mediaEscolar = new MediaEscolar();
                            controller = new MediaEscolarController(contexto);

                            mediaEscolar.setMateria(materiaSegundo.getText().toString());
                            mediaEscolar.setNotaTrabalho(Double.parseDouble(trabalhoSegundo.getText().toString()));
                            mediaEscolar.setNotaProva(Double.parseDouble(provaSegundo.getText().toString()));
                            mediaEscolar.setBimestre("2º Bimestre");

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

                            notaTrabalhoSeg = Double.parseDouble(trabalhoSegundo.getText().toString());
                            notaProvaSeg = Double.parseDouble(provaSegundo.getText().toString());
                            provaSegundo.setText(MainActivity.formatarDecimal(notaProvaSeg));
                            trabalhoSegundo.setText(MainActivity.formatarDecimal(notaTrabalhoSeg));


                        }else Toast.makeText(contexto,"Nota ACIMA do Permitido, MAXIMO--> 10.00", Toast.LENGTH_LONG).show();
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

                        calcular.setEnabled(true);
                        Toast.makeText(contexto,"Opss!!\nNão ha o que Limpar!!",Toast.LENGTH_LONG).show();

                    }else{
                        materiaSegundo.setText("");
                        provaSegundo.setText("");
                        trabalhoSegundo.setText("");
                        txtvwMedia.setText("0.0");
                        txtvwsituacao.setText("Indefinido");

                        txtvwMedia.setTextColor(Color.BLACK);
                        txtvwsituacao.setTextColor(Color.BLACK);

                        materiaSegundo.requestFocus();

                        calcular.setEnabled(true);
                        limpar.setEnabled(false);

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
                    if ((materiaSegundo.getText().length() != 0) && (provaSegundo.getText().length() != 0) && (trabalhoSegundo.getText().length() != 0)) {
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
