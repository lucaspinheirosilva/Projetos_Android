package com.example.lucasps.mediaescolharmvc.fragments;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.Toast;

import com.example.lucasps.mediaescolharmvc.R;
import com.example.lucasps.mediaescolharmvc.adapter.ResultadoFinalListAdapter;
import com.example.lucasps.mediaescolharmvc.controller.MediaEscolarController;
import com.example.lucasps.mediaescolharmvc.model.MediaEscolar;

import java.util.ArrayList;

public class Fragment_resultadoFinal extends Fragment {

    //dataSet com dados
    ArrayList<MediaEscolar> dataSet;
    //ListView para apresentar os dados
    ListView listView;
    //Controller para buscar os dados
    MediaEscolarController controller;

    ResultadoFinalListAdapter adapter;

    //Efeito de animação da listas

    //Contexto
    Context contexto;

    View view;

    public Fragment_resultadoFinal() {

    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

    }
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {


        view =  inflater.inflate(R.layout.fragment_resultadofinal, container, false);

        controller = new MediaEscolarController(getContext());
        listView = view.findViewById(R.id.listviewID);

        dataSet = controller.getAllResultadoFinal();

        final ResultadoFinalListAdapter adapter = new ResultadoFinalListAdapter(dataSet,getContext());

        listView.setAdapter(adapter);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView <?> parent, View view, int position, long id) {
                MediaEscolar mediaEscolar= dataSet.get(position);

                Toast.makeText(getContext(),mediaEscolar.getBimestre()+"\nMATERIA: "+
                                mediaEscolar.getMateria()+
                                "\nNOTA PROVA: "
                                +mediaEscolar.getNotaProva()+
                                "\nNOTA TRAB: "+
                                mediaEscolar.getNotaTrabalho()+
                                "\nMEDIA FINAL: "+
                                mediaEscolar.getMediaFinal()+
                                "\nSITUAÇÃO: "+mediaEscolar.getSituacao()
                        ,Toast.LENGTH_LONG).show();

                //atualiza a lista na camada View
                dataSet=controller.getAllResultadoFinal();
                adapter.atualizarLista(dataSet);




            }

        });
       return view;

        }

}
