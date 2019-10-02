package br.com.listacompras.model;

import java.io.Serializable;

/**
 * Criado por Lucas Pinheiro on 27/06/2019.
 */
public class ListaCompra implements Serializable {

    Long id;
    String nomeProduto;
    String marcaProduto;
    String codBarProduto;
    String categoriaProduto;
    String filtroPesquisa;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public String getMarcaProduto() {
        return marcaProduto;
    }

    public void setMarcaProduto(String marcaProduto) {
        this.marcaProduto = marcaProduto;
    }

    public String getCodBarProduto() {
        return codBarProduto;
    }

    public void setCodBarProduto(String codBarProduto) {
        this.codBarProduto = codBarProduto;
    }

    public String getCategoriaProduto() {
        return categoriaProduto;
    }

    public void setCategoriaProduto(String categoriaProduto) {
        this.categoriaProduto = categoriaProduto;
    }
    public String getFiltroPesquisa() {
        return filtroPesquisa;
    }
    public void setFiltroPesquisa(String filtroPesquisa) {
        this.filtroPesquisa = filtroPesquisa;
    }
}

