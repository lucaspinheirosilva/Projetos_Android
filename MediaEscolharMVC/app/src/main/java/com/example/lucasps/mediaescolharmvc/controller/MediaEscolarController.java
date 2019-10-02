package com.example.lucasps.mediaescolharmvc.controller;

import android.content.ContentValues;
import android.content.Context;

import com.example.lucasps.mediaescolharmvc.datamodel.MediaEscolarDataModel;
import com.example.lucasps.mediaescolharmvc.datasource.DataSource;
import com.example.lucasps.mediaescolharmvc.model.MediaEscolar;

import java.util.ArrayList;
import java.util.List;

/**
 * Criado por Lucas Pinheiro on 16/01/2019.
 */
public class MediaEscolarController extends DataSource {

    ContentValues dados;

    public MediaEscolarController(Context context) {
        super(context);
    }

    public double calcularMedia(MediaEscolar obj){

        double media = (obj.getNotaProva()+obj.getNotaTrabalho())/2;
        return media;
    }

    public String resultadoFinal(double media){
       //SE media >=6 FAÇA aprovado, SENÃO SE media>=4 && media<6 FAÇA recuperação SENÃO reprovado
        return media >=6?"Aprovado":(media>=4 && media<6)?"Recuperação":"Reprovado";

    }

    public  boolean salvar(MediaEscolar obj){

        boolean sucesso = true;

        dados = new ContentValues();
        dados.put(MediaEscolarDataModel.getMateria(),obj.getMateria());
        dados.put(MediaEscolarDataModel.getBimestre(),obj.getBimestre());
        dados.put(MediaEscolarDataModel.getSituacao(),obj.getSituacao());
        dados.put(MediaEscolarDataModel.getNotaProva(),obj.getNotaProva());
        dados.put(MediaEscolarDataModel.getNotaTrabalho(),obj.getNotaTrabalho());
        dados.put(MediaEscolarDataModel.getMediaFinal(),obj.getMediaFinal());

        sucesso = insert(MediaEscolarDataModel.getTABELA(),dados);

        return sucesso;
    }

    public boolean deletar (MediaEscolar obj){
        boolean sucesso = true;

        sucesso = deletar(MediaEscolarDataModel.getTABELA(),obj.getId());


        return sucesso;
    }

    public  boolean alterar(MediaEscolar obj){

        boolean sucesso = true;

        dados = new ContentValues();
        dados.put(MediaEscolarDataModel.getId(),obj.getId());
        dados.put(MediaEscolarDataModel.getMateria(),obj.getMateria());
        dados.put(MediaEscolarDataModel.getBimestre(),obj.getBimestre());
        dados.put(MediaEscolarDataModel.getSituacao(),obj.getSituacao());
        dados.put(MediaEscolarDataModel.getNotaProva(),obj.getNotaProva());
        dados.put(MediaEscolarDataModel.getNotaTrabalho(),obj.getNotaTrabalho());
        dados.put(MediaEscolarDataModel.getMediaFinal(),obj.getMediaFinal());

        sucesso = alterar(MediaEscolarDataModel.getTABELA(),dados);

        return sucesso;
    }

    public List<MediaEscolar>listar(){

        return getAllMediaEscolar() ;
    }

    // getResultadoFinal devolvendo ArrayList
    public ArrayList<MediaEscolar>getResultadoFinal(){
        return getAllResultadoFinal();
    }

}
