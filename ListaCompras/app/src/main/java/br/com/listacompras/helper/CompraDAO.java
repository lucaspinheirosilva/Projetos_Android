package br.com.listacompras.helper;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;


import java.util.ArrayList;
import java.util.List;

import br.com.listacompras.model.ListaCompra;

/**
 * Criado por Lucas Pinheiro on 28/06/2019.
 */
public class CompraDAO implements IntfceCompraDAO {

    private SQLiteDatabase escreve;
    private SQLiteDatabase ler;

    public CompraDAO(Context context) {

        DbHelper db = new DbHelper(context);
        escreve = db.getWritableDatabase();
        ler = db.getReadableDatabase();
    }

    @Override
    public boolean salvar(ListaCompra listaCompra) {

        ContentValues contentValues = new ContentValues();
        contentValues.put("nomeprod", listaCompra.getNomeProduto());
        contentValues.put("marca", listaCompra.getMarcaProduto());
        contentValues.put("codbarras", listaCompra.getCodBarProduto());
        contentValues.put("categoria", listaCompra.getCategoriaProduto());

        try {
            escreve.insert(DbHelper.TABELA_COMPRA, null, contentValues);
            Log.i("INFO_DB:", "DADOS GRAVADOS COM SUCESSO");
        } catch (Exception erro) {
            Log.i("INFO_DB:", "ERRO AO SALVAR DADOS" + erro.getMessage());
            return false;
        }


        return true;
    }

    @Override
    public boolean atualizar(ListaCompra listaCompra) {

        ContentValues contentValues = new ContentValues();

        contentValues.put("nomeprod", listaCompra.getNomeProduto());
        contentValues.put("marca", listaCompra.getMarcaProduto());
        contentValues.put("codbarras", listaCompra.getCodBarProduto());
        contentValues.put("categoria", listaCompra.getCategoriaProduto());
        try {
            String[] args = {listaCompra.getId().toString()};
            escreve.update(DbHelper.TABELA_COMPRA, contentValues, "id=?", args);

            Log.i("INFO_DB:", "PRODUTO ATUALIZADOS COM SUCESSO");
        } catch (Exception erro) {
            Log.i("INFO_DB:", "ERRO AO ATUALIZAR PRODUTO" + erro.getMessage());
            return false;
        }

        return true;
    }

    @Override
    public boolean deletar(ListaCompra listaCompra) {

        Long idProd = listaCompra.getId();
        String nomeProd = listaCompra.getNomeProduto();
        String marcaProd = listaCompra.getMarcaProduto();
        
        try {
            String[] args = {listaCompra.getId().toString()};
            escreve.delete(DbHelper.TABELA_COMPRA, "id=?", args);

            Log.i("INFO_DB:", "PRODUTO EXCLUIDO COM SUCESSO -->"+" ID: "+idProd+" NOME: "+nomeProd+" MARCA: "+marcaProd);
        } catch (Exception erro) {
            Log.i("INFO_DB:", "ERRO AO EXCLUIR PRODUTO -->"+" ID: "+idProd+" NOME: "+nomeProd+" MARCA: "+marcaProd+"-->"+erro.getMessage());
            return false;
        }

        return true;
    }

    @Override
    public List <ListaCompra> listar() {

        List <ListaCompra> listarprod = new ArrayList <>();

        String sqlListar = "SELECT * FROM " + DbHelper.TABELA_COMPRA + " ; ";
        Cursor cursor = ler.rawQuery(sqlListar, null);

        while (cursor.moveToNext()) {
            ListaCompra listaCompra = new ListaCompra();

            Long id = cursor.getLong(cursor.getColumnIndex("id"));
            String nomeprod = cursor.getString(cursor.getColumnIndex("nomeprod"));
            String marca = cursor.getString(cursor.getColumnIndex("marca"));
            String codbarras = cursor.getString(cursor.getColumnIndex("codbarras"));
            String categoria = cursor.getString(cursor.getColumnIndex("categoria"));

            listaCompra.setId(id);
            listaCompra.setNomeProduto(nomeprod);
            listaCompra.setMarcaProduto(marca);
            listaCompra.setCodBarProduto(codbarras);
            listaCompra.setCategoriaProduto(categoria);

            listarprod.add(listaCompra);
        }
        return listarprod;
    }

    @Override
    public List <ListaCompra> LocalizarProduto(ListaCompra listaCompra) {


        String filtro = listaCompra.getFiltroPesquisa();
        String sqlListar = "SELECT * FROM " + DbHelper.TABELA_COMPRA + " WHERE (nomeprod LIKE '%" + filtro + "%')" +
                " OR(marca LIKE '%" + filtro + "%')" +
                " OR(codbarras LIKE '%" + filtro + "%') ";

        Cursor cursor = ler.rawQuery(sqlListar, null);

        List <ListaCompra> listarprod = new ArrayList <>();

        while (cursor.moveToNext()) {
            ListaCompra compra = new ListaCompra();

            Long id = cursor.getLong(cursor.getColumnIndex("id"));
            String nomeprod = cursor.getString(cursor.getColumnIndex("nomeprod"));
            String marca = cursor.getString(cursor.getColumnIndex("marca"));
            String codbarras = cursor.getString(cursor.getColumnIndex("codbarras"));
            String categoria = cursor.getString(cursor.getColumnIndex("categoria"));

            compra.setId(id);
            compra.setNomeProduto(nomeprod);
            compra.setMarcaProduto(marca);
            compra.setCodBarProduto(codbarras);
            compra.setCategoriaProduto(categoria);

            listarprod.add(compra);
        }
        return listarprod;
    }

}
