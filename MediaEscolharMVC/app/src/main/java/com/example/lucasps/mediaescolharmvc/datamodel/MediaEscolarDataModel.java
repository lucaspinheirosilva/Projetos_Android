package com.example.lucasps.mediaescolharmvc.datamodel;

/**
 * Criado por Lucas Pinheiro on 17/01/2019.
 */
public class MediaEscolarDataModel {

    // Dadols para criar as tabelas no banco de dados
    // MOR - Modelo objeto relacional
    // TUPLA ou REGISTRO

    private  final  static String TABELA = "media_escolar";
    private  static String queryCriarTabela = "";

    private final static String Id = "id";
    private final static String materia = "materia";
    private final static String bimestre = "bimestre";
    private final static String situacao = "situacao";
    private final static String notaProva = "notaProva";
    private final static String notaTrabalho = "notaTrabalho";
    private final static String mediaFinal = "mediaFinal";

    // Criar dinamicamente uma Query SQL para criar a tebela MeDIA ESCOLAR no Bando de dados
    public static String criarTabela(){

        queryCriarTabela = "CREATE TABLE "+TABELA;
        queryCriarTabela += "(";
        queryCriarTabela += Id + " INTEGER PRIMARY KEY AUTOINCREMENT, ";
        queryCriarTabela += materia + " TEXT, ";
        queryCriarTabela += bimestre + " TEXT, ";
        queryCriarTabela += situacao + " TEXT, ";
        queryCriarTabela += notaProva + " REAL, ";
        queryCriarTabela += notaTrabalho + " REAL, ";
        queryCriarTabela += mediaFinal + " REAL ";
        queryCriarTabela += ")";

        return queryCriarTabela;
    }


    public static String getTABELA() {
        return TABELA;
    }

    public static String getQueryCriarTabela() {
        return queryCriarTabela;
    }

    public static void setQueryCriarTabela(String queryCriarTabela) {
        MediaEscolarDataModel.queryCriarTabela = queryCriarTabela;
    }

    public static String getId() {
        return Id;
    }

    public static String getMateria() {
        return materia;
    }

    public static String getBimestre() {
        return bimestre;
    }

    public static String getSituacao() {
        return situacao;
    }

    public static String getNotaProva() {
        return notaProva;
    }

    public static String getNotaTrabalho() {
        return notaTrabalho;
    }

    public static String getMediaFinal() {
        return mediaFinal;
    }



}

