package br.com.listacompras.helper;

import java.util.List;

import br.com.listacompras.model.ListaCompra;

/**
 * Criado por Lucas Pinheiro on 28/06/2019.
 */
public interface IntfceCompraDAO {

    public boolean salvar(ListaCompra listaCompra);
    public boolean atualizar(ListaCompra listaCompra);
    public boolean deletar(ListaCompra listaCompra);
    public List<ListaCompra>listar();
    public List<ListaCompra> LocalizarProduto(ListaCompra listaCompra);


}
