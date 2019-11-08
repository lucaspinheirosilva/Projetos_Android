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

public class Fragment_primeiroBim extends Fragment {

    View view;

    Button calcular, limpar,salvar;

    EditText materiaPrimeiro;
    EditText provaPrimeiro;
    EditText trabalhoPrimeiro;

    TextView txtvwMedia;
    TextView txtvwsituacao;


    Double notaProvaPrime;
    Double notaTrabalhoPrime;
    Double media;
    Context contexto;

    boolean DadosValidados=true;

    MediaEscolar mediaEscolar;
    MediaEscolarController controller;

    public Fragment_primeiroBim() {

    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

    }
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        view =  inflater.inflate(R.layout.fragment_primeiro_bim,container, false);

        contexto = getContext();
        calcular = view.findViewById(R.id.btn_PrimeiroBimCalcularID);
        salvar = view.findViewById(R.id.btn_SalvarBimSalvarID);
        limpar = view.findViewById(R.id.btn_PrimeiroBimLimparID);
        materiaPrimeiro = view.findViewById(R.id.edtxt_materiaPrimeiroBimID);
        provaPrimeiro = view.findViewById(R.id.edtxt_provaPrimeiroBimID);
        trabalhoPrimeiro = view.findViewById(R.id.edtxt_trabalPrimeiroBimID);
        txtvwMedia = view.findViewById(R.id.txtvw_mediaPrimeiroFinalID);
        txtvwsituacao = view.findViewById(R.id.txtvw_resultadoPrimeiroFinalID);

        salvar.setEnabled(false);

        //CALCULAR
        calcular.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DadosValidados = true;
                if (materiaPrimeiro.getText().toString().isEmpty()){
                    materiaPrimeiro.setError("Obrigatorio");
                    materiaPrimeiro.requestFocus();
                    DadosValidados=false;

                }else if(provaPrimeiro.getText().toString().isEmpty()){
                    provaPrimeiro.setError("Obrigatorio");
                    provaPrimeiro.requestFocus();
                    DadosValidados=false;

                }else if(trabalhoPrimeiro.getText().toString().isEmpty()) {
                    trabalhoPrimeiro.setError("Obrigatorio");
                    trabalhoPrimeiro.requestFocus();
                    DadosValidados=false;

                }else if (Double.valueOf(provaPrimeiro.getText().toString()) >= 10.1){
                    Toast.makeText(getContext(),"Nota acima do permitido",Toast.LENGTH_LONG).show();
                    provaPrimeiro.requestFocus();
                    provaPrimeiro.setError("*");
                    DadosValidados = false;

                }else if(Double.valueOf(trabalhoPrimeiro.getText().toString())>=10.1){
                    Toast.makeText(getContext(),"Nota acima do permitido",Toast.LENGTH_LONG).show();
                    trabalhoPrimeiro.requestFocus();
                    trabalhoPrimeiro.setError("*");
                    DadosValidados = false;

                }
                else if (DadosValidados) {

                    mediaEscolar = new MediaEscolar();
                    controller = new MediaEscolarController(contexto);

                    mediaEscolar.setMateria(materiaPrimeiro.getText().toString());
                    mediaEscolar.setNotaProva(Double.parseDouble(provaPrimeiro.getText().toString()));
                    mediaEscolar.setNotaTrabalho(Double.parseDouble(trabalhoPrimeiro.getText().toString()));
                    mediaEscolar.setBimestre("1º Bimestre");

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

                    notaProvaPrime = Double.parseDouble(provaPrimeiro.getText().toString());
                    notaTrabalhoPrime = Double.parseDouble(trabalhoPrimeiro.getText().toString());

                    provaPrimeiro.setText(MainActivity.formatarDecimal(notaProvaPrime));
                    trabalhoPrimeiro.setText(MainActivity.formatarDecimal(notaTrabalhoPrime));

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

                        Toast.makeText(contexto, "Opss!!\nNão ha o que Limpar!!", Toast.LENGTH_LONG).show();
                        calcular.setEnabled(true);

                    } else {
                        materiaPrimeiro.setText("");
                        provaPrimeiro.setText("");
                        trabalhoPrimeiro.setText("");
                        txtvwMedia.setText("0.0");
                        txtvwsituacao.setText("Indefinido");

                        txtvwMedia.setTextColor(Color.BLACK);
                        txtvwsituacao.setTextColor(Color.BLACK);


                        materiaPrimeiro.requestFocus();
                        calcular.setEnabled(true);

                        Toast.makeText(contexto, "Todos os Campos Estão Limpos!!", Toast.LENGTH_LONG).show();

                    }


                } catch (Exception Erro) {
                    Toast.makeText(contexto, Erro.getMessage(), Toast.LENGTH_LONG).show();
                }


            }
        });
        //SALVAR DADOS NO BANCO DE DADOS
        salvar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    if ((materiaPrimeiro.getText().length() != 0) && (provaPrimeiro.getText().length() != 0) && (trabalhoPrimeiro.getText().length() != 0)) {
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
