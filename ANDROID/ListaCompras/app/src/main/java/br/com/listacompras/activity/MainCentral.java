package br.com.listacompras.activity;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;

import br.com.listacompras.R;


public class MainCentral extends AppCompatActivity {

    ImageView listarCompras;
    ImageView listarProdutos;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().hide();//esconder a actionBar
        setContentView(R.layout.activity_main_central);

        listarCompras = findViewById(R.id.img_ListarCompras);
        listarProdutos = findViewById(R.id.img_ListarProdutos);

        //****CHAMAR A TELA DE LISTAGEM DE PRODUTOS*****//
        listarProdutos.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intentProdutos = new Intent(MainCentral.this, ListaProdutosActivity.class);
                startActivity(intentProdutos);

            }
        });
        //****CHAMAR A TELA DE LISTAGEM DE COMPRAS*****//
        listarProdutos.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intentCompras = new Intent(MainCentral.this, ListaCompraActivity.class);
                startActivity(intentCompras);

            }
        });



    }
}
