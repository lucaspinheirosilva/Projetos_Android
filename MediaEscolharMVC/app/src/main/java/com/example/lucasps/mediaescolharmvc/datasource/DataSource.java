package com.example.lucasps.mediaescolharmvc.datasource;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Environment;

import android.util.Log;


import com.example.lucasps.mediaescolharmvc.datamodel.MediaEscolarDataModel;
import com.example.lucasps.mediaescolharmvc.model.MediaEscolar;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.List;

/**
 * Criado por Lucas Pinheiro on 17/01/2019.
 */


public class DataSource extends SQLiteOpenHelper{

     private static final String DB_NAME = "media_escolarMCV.sqlite";
     private static final int DB_VERSION = 2;

     Cursor cursor;

     SQLiteDatabase db;

    public DataSource(Context context){
        super(context,DB_NAME,null,DB_VERSION);


        db = getWritableDatabase();
    }

    @Override
    public void onCreate(SQLiteDatabase db) {

        try {
            db.execSQL(MediaEscolarDataModel.criarTabela());

        }catch (Exception erro){

            Log.e("ERRO NO DATA SOURCE",erro.getMessage());

        }

    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {

    }

    public boolean insert (String tabela, ContentValues dados){

        boolean sucesso = true;
        try {

            sucesso = db.insert(tabela,null,dados) > 0;

            }catch (Exception erro){
            sucesso = false;

        }
        return true;
    }

    public  boolean deletar(String tabela, int id){
        boolean sucesso = true;
sucesso = db.delete(tabela,"id=?",
        new String[]{Integer.toString(id)})>0;


        return sucesso;
    }

    public  boolean alterar(String tabela, ContentValues dados){
        boolean sucesso = true;

        int id = dados.getAsInteger("id");

        sucesso = db.update(tabela,dados,"id=?",
                new String[]{Integer.toString(id)})>0;


        return sucesso;
    }

    public  List<MediaEscolar> getAllMediaEscolar(){

        MediaEscolar obj;

        List<MediaEscolar> lista = new ArrayList<>();

        String sql = "SELECT * FROM "+ MediaEscolarDataModel.getTABELA()+
                " ORDER BY bimestre";

        cursor = db.rawQuery(sql,null);

        if (cursor.moveToFirst()){
            do {
                obj = new MediaEscolar();

                obj.setId(cursor.getInt(cursor.getColumnIndex(MediaEscolarDataModel.getId())));
                obj.setMateria(cursor.getString(cursor.getColumnIndex(MediaEscolarDataModel.getMateria())));

                lista.add(obj);

            }while (cursor.moveToNext());

        }
        cursor.close();
        return lista;
    }

    public  ArrayList<MediaEscolar> getAllResultadoFinal(){

        MediaEscolar obj;

        ArrayList<MediaEscolar> lista = new ArrayList<>();

        String sql = "SELECT * FROM "+ MediaEscolarDataModel.getTABELA()+
                " ORDER BY bimestre";

        cursor = db.rawQuery(sql,null);

        if (cursor.moveToFirst()){
            do {
                obj = new MediaEscolar();

                obj.setId(cursor.getInt(cursor.getColumnIndex(MediaEscolarDataModel.getId())));
                obj.setMateria(cursor.getString(cursor.getColumnIndex(MediaEscolarDataModel.getMateria())));
                obj.setBimestre(cursor.getString(cursor.getColumnIndex(MediaEscolarDataModel.getBimestre())));
                obj.setSituacao(cursor.getString(cursor.getColumnIndex(MediaEscolarDataModel.getSituacao())));
                obj.setNotaProva(cursor.getDouble(cursor.getColumnIndex(MediaEscolarDataModel.getNotaProva())));
                obj.setNotaTrabalho(cursor.getDouble(cursor.getColumnIndex(MediaEscolarDataModel.getNotaTrabalho())));
                obj.setMediaFinal(cursor.getDouble(cursor.getColumnIndex(MediaEscolarDataModel.getMediaFinal())));


                lista.add(obj);

            }while (cursor.moveToNext());

        }
        cursor.close();
        return lista;
    }

    public void backupBandoDeDados(){

        File sd; //caminho destino - Download
        File data; //caminho origem - data/data/pacote/db_name

        File arquivoBancoDeDados; //nome do banco de dados
        File arquivoBackupBancoDeDados; //nome do arquivo Backup

        FileChannel origem; //Leitura do arquivo original
        FileChannel destino; // Gravação do arquivo de destino com backup

        try {
            sd = Environment.getExternalStoragePublicDirectory(
                    Environment.DIRECTORY_DOWNLOADS);
            data = Environment.getDataDirectory();

            Log.e("BD","SD - "+sd.getAbsolutePath());
            Log.e("DB","DATA - "+data.getAbsolutePath());

            if (sd.canWrite()){
                String nomeDoBancoDeDados = "//data//com.example.lucasps.mediaescolharmvc//databases/" + DB_NAME;
                String nomeDoArquivoBackup = "bkp_"+DB_NAME;

                arquivoBancoDeDados = new File(data,nomeDoBancoDeDados);
                arquivoBackupBancoDeDados = new File(sd,nomeDoArquivoBackup);

                if (arquivoBancoDeDados.exists()){
                    origem = new FileInputStream(arquivoBancoDeDados).getChannel();
                    destino = new FileOutputStream(arquivoBackupBancoDeDados).getChannel();

                    destino.transferFrom(origem,0,origem.size());
                    origem.close();
                    destino.close();
                }
            }

        }catch (Exception erro){
            Log.v("ERRO NO APLICATIVO ===>",erro.getMessage());

        }
    }

}



