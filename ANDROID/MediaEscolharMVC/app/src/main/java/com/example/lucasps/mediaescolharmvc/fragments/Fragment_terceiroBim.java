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

public class Fragment_terceiroBim extends Fragment {

    View view;

    Button calcular,limpar,salvar;

    EditText materiaTerceiro;
    EditText provaTerceiro;
    EditText trabalhoTerceiro;

    TextView txtvwMedia;
    TextView txtvwsituacao;


    Double notaProvaTerc;
    Double notaTrabalhoTerc;
    Double media;

    boolean DadosValidados = true;

    Context contexto;

    MediaEscolar mediaEscolar;
    MediaEscolarController controller;


    public Fragment_terceiroBim() {

    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

    }
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        view =  inflater.inflate(R.layout.fragment_terceiro_bim, container, false);

        contexto = getContext();

        calcular = view.findViewById(R.id.btn_TerceiroBimCalcularID);
        limpar = view.findViewById(R.id.btn_TerceiroBimLimparID);
        salvar = view.findViewById(R.id.btn_TerceiroBimSalvarID);

        materiaTerceiro = view.findViewById(R.id.edtxt_materiaTerceiroBimID);
        provaTerceiro = view.findViewById(R.id.edtxt_provaTerceiroBimID);
        trabalhoTerceiro = view.findViewById(R.id.edtxt_trabalTerceiroBimID);

        txtvwMedia = view.findViewById(R.id.txtvw_mediaTerceiroFinalID);
        txtvwsituacao = view.findViewById(R.id.txtvw_resultadoTerceiroFinalID);

        salvar.setEnabled(false);


        //CALCULAR
        calcular.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                DadosValidados = true;

                if (trabalhoTerceiro.getText().toString().isEmpty()) {
                    trabalhoTerceiro.requestFocus();
                    trabalhoTerceiro.setError("Obrigatorio");
                    DadosValidados = false;

                }
                else if (provaTerceiro.getText().toString().isEmpty()) {
                    provaTerceiro.setError("Obrigatorio");
                    provaTerceiro.requestFocus();
                    DadosValidados = false;

                }
                else if (materiaTerceiro.getText().toString().isEmpty()) {
                    materiaTerceiro.requestFocus();
                    materiaTerceiro.setError("Obrigatorio");
                    DadosValidados = false;
                }
                   else if (Double.parseDouble(trabalhoTerceiro.getText().toString()) > 10) {
                        trabalhoTerceiro.requestFocus();
                        trabalhoTerceiro.setError("*");
                        DadosValidados = false;
                        Toast.makeText(contexto, "Nota ACIMA do Permitido, MAXIMO--> 10.00", Toast.LENGTH_LONG).show();
                    }
                    else if (Double.parseDouble(trabalhoTerceiro.getText().toString()) > 10) {
                        provaTerceiro.requestFocus();
                        provaTerceiro.setError("*");
                        DadosValidados = false;
                        Toast.makeText(contexto, "Nota ACIMA do Permitido, MAXIMO--> 10.00", Toast.LENGTH_LONG).show();
                    }
                    else {
                        if (DadosValidados) {
                            mediaEscolar = new MediaEscolar();
                            controller = new MediaEscolarController(contexto);

                            mediaEscolar.setMateria(materiaTerceiro.getText().toString());
                            mediaEscolar.setNotaProva(Double.parseDouble(provaTerceiro.getText().toString()));
                            mediaEscolar.setNotaTrabalho(Double.parseDouble(trabalhoTerceiro.getText().toString()));
                            mediaEscolar.setBimestre("3º Bimestre");

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

                            notaTrabalhoTerc = Double.parseDouble(trabalhoTerceiro.getText().toString());
                            notaProvaTerc = Double.parseDouble(provaTerceiro.getText().toString());

                            provaTerceiro.setText(MainActivity.formatarDecimal(notaProvaTerc));
                            trabalhoTerceiro.setText(MainActivity.formatarDecimal(notaTrabalhoTerc));


                        } else
                            Toast.makeText(contexto, "Nota ACIMA do Permitido, MAXIMO--> 10.00", Toast.LENGTH_LONG).show();
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

                        calcular.setEnabled(true);
                        Toast.makeText(contexto,"Opss!!\nNão ha o que Limpar!!",Toast.LENGTH_LONG).show();

                    }else{
                        materiaTerceiro.setText("");
                        provaTerceiro.setText("");
                        trabalhoTerceiro.setText("");
                        txtvwMedia.setText("0.0");
                        txtvwsituacao.setText("Indefinido");

                        txtvwMedia.setTextColor(Color.BLACK);
                        txtvwsituacao.setTextColor(Color.BLACK);


                        materiaTerceiro.requestFocus();
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
                    if ((materiaTerceiro.getText().length() != 0) && (provaTerceiro.getText().length() != 0) && (trabalhoTerceiro.getText().length() != 0)) {
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
