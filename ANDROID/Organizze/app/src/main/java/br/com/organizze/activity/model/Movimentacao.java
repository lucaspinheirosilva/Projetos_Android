package br.com.organizze.activity.model;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DatabaseReference;

import java.util.Objects;

import br.com.organizze.activity.config.FirebaseConfiguracao;
import br.com.organizze.activity.helper.Base64Custom;
import br.com.organizze.activity.helper.DataCustom;

/**
 * Criado por Lucas Pinheiro on 08/01/2020.
 */
public class Movimentacao {

    private String data;
    private String categoria;
    private String descricao;
    private String tipo;
    private Double valor;

    public Movimentacao() {
    }

    public void Salvar(String dataEscolhida) {
        FirebaseAuth autenticacao = FirebaseConfiguracao.getFirebaseAutenticacao();

        String idUsuario = Base64Custom.codificarBase64(Objects.requireNonNull(autenticacao.getCurrentUser()).getEmail());

        String mesAno = DataCustom.MesAnoDataAtual(dataEscolhida);

        DatabaseReference firebase = FirebaseConfiguracao.getFirebaseDatabase();
        firebase.child("movimentacao")
                .child(idUsuario)
                .child(mesAno)
                .push()
                .setValue(this);
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }
}
