package com.example.lucasps.mediaescolharmvc.model;

/**
 * Criado por Lucas Pinheiro em 16/01/2019.
 */

/*
*Classe POJO => classe que nao tem Regra de negocio
    Só tem seus Get and Set
    */
public class MediaEscolar {

    private int Id;
    private String materia;
    private String bimestre;
    private String situacao;
    private double notaProva;
    private double notaTrabalho;
    private double mediaFinal;

    public MediaEscolar(){


    }


    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public String getBimestre() {
        return bimestre;
    }

    public void setBimestre(String bimestre) {
        this.bimestre = bimestre;
    }

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

    public double getNotaProva() {
        return notaProva;
    }

    public void setNotaProva(double notaProva) {
        this.notaProva = notaProva;
    }

    public double getNotaTrabalho() {
        return notaTrabalho;
    }

    public void setNotaTrabalho(double notaTrabalho) {
        this.notaTrabalho = notaTrabalho;
    }

    public double getMediaFinal() {
        return mediaFinal;
    }

    public void setMediaFinal(double mediaFinal) {
        this.mediaFinal = mediaFinal;
    }
}
