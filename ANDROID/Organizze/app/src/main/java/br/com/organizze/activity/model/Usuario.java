package br.com.organizze.activity.model;

import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.Exclude;

import br.com.organizze.activity.config.FirebaseConfiguracao;

/**
 * Criado por Lucas Pinheiro on 01/01/2020.
 */
public class Usuario {

    private String idUsuario;
    private String nome;
    private String email;
    private String senha;
    private Double despesasTotal = 0.00;
    private Double receitasTotal = 0.00;

    public Usuario() {
    }
    public void Salvar(){
        DatabaseReference firebase= FirebaseConfiguracao.getFirebaseDatabase();
        firebase.child("usuarios").
                child(this.idUsuario).
                setValue(this);
    }

    public Double getDespesasTotal() {
        return despesasTotal;
    }

    public void setDespesasTotal(Double despesasTotal) {
        this.despesasTotal = despesasTotal;
    }

    public Double getReceitasTotal() {
        return receitasTotal;
    }

    public void setReceitasTotal(Double receitasTotal) {
        this.receitasTotal = receitasTotal;
    }

    @Exclude
    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Exclude
    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
}
