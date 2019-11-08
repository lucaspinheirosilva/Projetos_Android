package com.example.lucasps.mediaescolharmvc.adapter;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.database.DataSetObserver;
import android.graphics.Color;
import android.support.annotation.NonNull;
import android.support.design.widget.Snackbar;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.example.lucasps.mediaescolharmvc.R;
import com.example.lucasps.mediaescolharmvc.controller.MediaEscolarController;
import com.example.lucasps.mediaescolharmvc.fragments.Fragment_resultadoFinal;
import com.example.lucasps.mediaescolharmvc.model.MediaEscolar;

import java.util.ArrayList;

/**
 * Criado por Lucas Pinheiro on 03/02/2019.
 */
//Herdar ArrayAdapter - MediaEscolar
//Implementar OnClickListener
public class ResultadoFinalListAdapter
        extends ArrayAdapter<MediaEscolar>
        implements View.OnClickListener  {

    //Contexto
    Context context;

    //Atributo pora conhecer a posição no Array - Animação
    private int ultimaPosicao = -1;

    //Alert-Dialog
    AlertDialog.Builder builder;
    AlertDialog alert;

    //torna o ViewHolder visivel em todas as classes(global)
    ViewHolder linha;

    //OBJETOS E COLEÇÃO DE OBJETOS "dataSet"
    ArrayList<MediaEscolar> dados;
    MediaEscolar mediaEscolar;
    MediaEscolarController controller;

    //Classe ViewHolder para os componentes ImageView w TextView
    private static class ViewHolder {
        TextView txtBimestre;
        TextView txtSituacao;
        TextView txtMateria;
        TextView txtMediaFinal;

        ImageView imgLogo;

        LinearLayout layout;

        ImageButton salvar;
        ImageButton deletar;
        ImageButton pesquisar;
        ImageButton alterar;


    }

    //Contrutor que receba o dataSet
    public ResultadoFinalListAdapter(ArrayList<MediaEscolar> dataSet,
                                     Context context) {
        super(context, R.layout.listview_resultado_final, dataSet);

        this.dados = dataSet;

        this.context = context;
    }

    public void remover(int posicao){
        dados.remove(posicao);

    }
    public void atualizarLista(ArrayList<MediaEscolar>novosDados){
        this.dados.clear();
        this.dados.addAll(novosDados);
        notifyDataSetChanged();
    }
    @Override
    public void registerDataSetObserver(DataSetObserver observer)
    {
        super.registerDataSetObserver(observer);
    }

    @Override
    public void onClick(View view) {

        final int posicao = (Integer) view.getTag();

        final Object object = getItem(posicao);


        mediaEscolar = (MediaEscolar) object;
        controller = new MediaEscolarController(context);
        switch (view.getId()) {

            case R.id.imgLogo:

                // Aprensentar os dados detalhados

                Snackbar.make(view, "Nota da Prova " + mediaEscolar.getNotaProva(),
                        Snackbar.LENGTH_LONG)
                        .setAction("No action", null).show();

                break;

            case R.id.imgbtn_deletar://deletar
                builder= new AlertDialog.Builder(context);
                builder.setTitle("DELETAR");
                builder.setMessage("Deseja DELETAR este registro?");
                builder.setCancelable(true);
                builder.setIcon(R.mipmap.ic_deletar);

                builder.setPositiveButton("SIM", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        controller.deletar(mediaEscolar);
                        remover(posicao);
                        notifyDataSetChanged();

                    }
                });
                builder.setNegativeButton("NÃO", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.cancel();
                    }
                });
                alert=builder.create();
                alert.show();
                break;

            case R.id.imgbtn_alterar://alterar

                View alertView = view.inflate(context,R.layout.alert_dialog_editar_listview,null);//Layout para o alertDialog disponivel

                final EditText alert_edtMateria = alertView.findViewById(R.id.alertEditMateria);
                final EditText alert_notaProva = alertView.findViewById(R.id.alertEditNotaProva);
                final EditText alert_notaTrabalho = alertView.findViewById(R.id.alertEditNotaTrabalho);

                //popular os campos com os registros
                alert_edtMateria.setText(mediaEscolar.getMateria());
                alert_notaProva.setText(String.valueOf(mediaEscolar.getNotaProva()));
                alert_notaTrabalho.setText(String.valueOf(mediaEscolar.getNotaTrabalho()));

                //montar o alertDialog
                AlertDialog.Builder alertbox = new AlertDialog.Builder(alertView.getRootView().getContext());
                alertbox.setMessage(mediaEscolar.getBimestre());
                alertbox.setTitle("EDITANDO..");

                alertbox.setView(alertView);

                alertbox.setNeutralButton("Salvar", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        mediaEscolar.setMateria(alert_edtMateria.getText().toString());
                        mediaEscolar.setNotaProva(Double.parseDouble(alert_notaProva.getText().toString()));
                        mediaEscolar.setNotaTrabalho(Double.parseDouble(alert_notaTrabalho.getText().toString()));

                            Double mediaFinal = controller.calcularMedia(mediaEscolar);//faz o calculo la na controller
                            mediaEscolar.setMediaFinal(mediaFinal);

                            mediaEscolar.setSituacao(controller.resultadoFinal(mediaFinal));

                            controller.alterar(mediaEscolar);

                            atualizarLista(controller.getResultadoFinal());
                        }

                });
                alertbox.show();
                break;

            case R.id.imgbtn_Pesquisar: //pesquisar

                builder= new AlertDialog.Builder(context);
                builder.setTitle("CONSULTAR");

                builder.setMessage(mediaEscolar.getBimestre()+"\n\nMATERIA : "+mediaEscolar.getMateria()+
                        "\nTRABALHO: "+mediaEscolar.getNotaTrabalho()+"\nPROVA: "+mediaEscolar.getNotaProva()+
                        "\nMEDIA FINAL: "+mediaEscolar.getMediaFinal()+"\n\nSITUAÇÃO: "+ mediaEscolar.getSituacao());
                builder.setCancelable(true);
                builder.setIcon(R.mipmap.ic_pesquisar);

                builder.setNegativeButton("VOLTAR", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.cancel();
                    }
                });
                alert=builder.create();
                alert.show();

                break;

            case R.id.imgbtn_salvar: //salvar

                builder= new AlertDialog.Builder(context);
                builder.setTitle("SALVAR");

                builder.setMessage("Deseja SALVAR este Registro?");
                builder.setCancelable(true);
                builder.setIcon(R.mipmap.ic_salvar);

                builder.setNegativeButton("NÃO", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.cancel();
                    }
                });
                builder.setPositiveButton("SIM", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {

                        controller.salvar(mediaEscolar);

                    }
                });
                alert=builder.create();
                alert.show();

                break;

        }
    }

    //Devolver via getView linha por linha para o ListView
    @NonNull
    @Override
    public View getView(int position,
                        View dataSet,
                        @NonNull ViewGroup parent) {

        mediaEscolar = getItem(position);



        if (dataSet == null) {

            linha = new ViewHolder();

            LayoutInflater layoutResultadoFinalList = LayoutInflater.from(getContext());

            dataSet = layoutResultadoFinalList.inflate(R.layout.listview_resultado_final,
                    parent,
                    false);

            linha.txtMateria = dataSet.findViewById(R.id.txtMateria);
            linha.txtBimestre = dataSet.findViewById(R.id.txtBimestre);
            linha.txtSituacao = dataSet.findViewById(R.id.txtSituacao);
            linha.txtMediaFinal = dataSet.findViewById(R.id.txtmediaRESULTADOFinalPrimeiro);

            linha.imgLogo = dataSet.findViewById(R.id.imgLogo);

            linha.alterar = dataSet.findViewById(R.id.imgbtn_alterar);
            linha.salvar = dataSet.findViewById(R.id.imgbtn_salvar);
            linha.deletar = dataSet.findViewById(R.id.imgbtn_deletar);
            linha.pesquisar = dataSet.findViewById(R.id.imgbtn_Pesquisar);
            linha.layout = dataSet.findViewById(R.id.layoutID);

            dataSet.setTag(linha);



        }else {

            linha = (ViewHolder) dataSet.getTag();
            linha.txtBimestre.setText("Nenhum Registro Encontrado");
        }
        linha.txtMateria.setText(mediaEscolar.getMateria());
        linha.txtBimestre.setText(mediaEscolar.getBimestre());
        linha.txtSituacao.setText(mediaEscolar.getSituacao());
        linha.txtMediaFinal.setText(String.valueOf(mediaEscolar.getMediaFinal()));

        if (mediaEscolar.getSituacao().equals("Aprovado"))
        {
            linha.txtSituacao.setTextColor(Color.BLUE);//azul
            linha.txtMediaFinal.setTextColor(Color.BLUE);
            linha.layout.setBackgroundColor(Color.parseColor("#C7D9E7"));
        }
        else if(mediaEscolar.getSituacao().equals("Recuperação"))
        {
            linha.txtSituacao.setTextColor(Color.parseColor("#FF8000"));//laranja
            linha.txtMediaFinal.setTextColor(Color.parseColor("#FF8000"));
            linha.layout.setBackgroundColor(Color.parseColor("#FFFFE2"));
        }
        else if(mediaEscolar.getSituacao().equals("Reprovado")) {
            linha.txtSituacao.setTextColor(Color.RED);//vermelho
            linha.txtMediaFinal.setTextColor(Color.RED);
            linha.layout.setBackgroundColor(Color.parseColor("#FBB9B9"));

        }

        linha.imgLogo.setOnClickListener(this);
        linha.imgLogo.setTag(position);

        linha.salvar.setOnClickListener(this);
        linha.salvar.setTag(position);

        linha.alterar.setOnClickListener(this);
        linha.alterar.setTag(position);

        linha.deletar.setOnClickListener(this);
        linha.deletar.setTag(position);

        linha.pesquisar.setOnClickListener(this);
        linha.pesquisar.setTag(position);

        return dataSet;
    }

}
