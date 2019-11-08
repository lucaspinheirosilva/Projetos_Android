package br.com.listacompras.helper;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
import android.widget.Toast;

/**
 * Criado por Lucas Pinheiro on 28/06/2019.
 */
public class DbHelper extends SQLiteOpenHelper {

    Context contextToast;

    public static int VERSION = 1;
    public static String NOME_DB = "DB_COMPRA";
    public static String TABELA_COMPRA = "compra";

    public DbHelper(Context context) {
        super(context, NOME_DB, null, VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        //ITILIZAR PARA CRIAR A 1º VEZ O BANCO DE DADOS

        String sql = "CREATE TABLE IF NOT EXISTS " + TABELA_COMPRA
                + " (id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                " nomeprod TEXT NOT NULL, " +
                " marca TEXT NOT NULL, " +
                " codbarras TEXT, " +
                " categoria TEXT NOT NULL ) ";
        try {
            db.execSQL(sql);
            Log.i("DB_INFO:","BANCO CRIADO COM SUCESSO");

        } catch (Exception erro) {
            Toast.makeText(contextToast, "ERRO AO CRIAR BANCO DE DADOS:" + erro.getMessage(), Toast.LENGTH_SHORT).show();
        }

    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        //UTILIZADO para atualizar tabelas ou APP



    }
}
