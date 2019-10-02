package br.com.listacompras.activity;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.DividerItemDecoration;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.AdapterView;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.Toast;

import com.google.android.gms.vision.barcode.Barcode;
import com.notbytes.barcode_reader.BarcodeReaderActivity;

import java.util.ArrayList;
import java.util.List;

import br.com.listacompras.R;
import br.com.listacompras.adapter.ListaCompraAdapter;
import br.com.listacompras.adapter.ListaProdutosAdapter;
import br.com.listacompras.helper.CompraDAO;
import br.com.listacompras.helper.RecyclerItemClickListiner;
import br.com.listacompras.model.ListaCompra;

public class ListaCompraActivity extends AppCompatActivity {

    //**VARIAVEIS****
    FloatingActionButton fabAdicionarProduto;
    FloatingActionButton fabLocalizarProduto;
    RecyclerView rcrvwListagemProduto;

    ListaCompraAdapter listaCompraAdapter;
    List <ListaCompra> listProdutos = new ArrayList <>();
    EditText edtxt_localizarPorNome;
    ImageButton biparProdutoCompra;


    ListaCompra produtoSelecionado;

    private static final int BARCODE_READER_ACTIVITY_REQUEST = 1208;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lista_compra);

        getSupportActionBar().hide();//esconder a actionBar

        final CompraDAO compraDAO = new CompraDAO(getApplicationContext());


        //***SETAR VARIAVEIS COM ids DOS COMPONENTES*****

        rcrvwListagemProduto= findViewById(R.id.rcrvw_listarProdutosCompras);
        edtxt_localizarPorNome = findViewById(R.id.edtxt_AcharPorNOMECompras);
        biparProdutoCompra = findViewById(R.id.btn_biparProduto);

        //ADICIONAR evento de click DO RECYCLERVIEW
        rcrvwListagemProduto.addOnItemTouchListener(
                new RecyclerItemClickListiner(getApplicationContext(),
                        rcrvwListagemProduto, new RecyclerItemClickListiner.OnItemClickListener() {
                    @Override
                    public void onItemClick(View view, int position) {

                    }

                    @Override
                    public void onLongItemClick(View view, int position) {

                        //Recuper produto para edição
                        produtoSelecionado = listProdutos.get(position);

                        //Enviar produto para a tela de adicionar produto
                        Intent intent = new Intent(ListaCompraActivity.this, AddListaProdutoActivity.class);
                        intent.putExtra("produtoSelecionado", produtoSelecionado);
                        startActivity(intent);
                    }

                    @Override
                    public void onItemClick(AdapterView <?> parent, View view, int position, long id) {

                    }
                })
        );

        //***Localizar por NOME o produto***
        edtxt_localizarPorNome.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
                CarregarListaCompras();
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                //recupera o texto digitado pelo usuario
                String filtro = edtxt_localizarPorNome.getText().toString();

                produtoSelecionado = new ListaCompra();
                produtoSelecionado.setFiltroPesquisa(filtro);

                listProdutos = compraDAO.LocalizarProduto(produtoSelecionado);

                listaCompraAdapter = new ListaCompraAdapter(listProdutos);

                RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(getApplicationContext());
                rcrvwListagemProduto.invalidate();
                rcrvwListagemProduto.setLayoutManager(layoutManager);
                rcrvwListagemProduto.setHasFixedSize(false);

                /**https://www.udemy.com/curso-de-desenvolvimento-android-oreo/learn/lecture/9124084#questions/6267586**/
                //se ja tiver a linha de decoração ele remove e coloca novamnete para nao ficar criando
                // linha amais a cada refresh da activity
                while (rcrvwListagemProduto.getItemDecorationCount() > 0) {
                    rcrvwListagemProduto.removeItemDecorationAt(0);
                }
                rcrvwListagemProduto.addItemDecoration(new DividerItemDecoration(getApplicationContext(), LinearLayout.VERTICAL));
                rcrvwListagemProduto.setAdapter(listaCompraAdapter);

            }

            @Override
            public void afterTextChanged(Editable s) {

            }
        });


        //***BOTÃO PARA LER CODIGO DE BARRAS****//
        biparProdutoCompra.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                FragmentManager supportFragmentManager = getSupportFragmentManager();
                FragmentTransaction fragmentTransaction = supportFragmentManager.beginTransaction();
                Fragment fragmentById = supportFragmentManager.findFragmentById(R.id.fm_container);
                if (fragmentById != null) {
                    fragmentTransaction.remove(fragmentById);
                }
                fragmentTransaction.commitAllowingStateLoss();

                Intent launchIntent = BarcodeReaderActivity.getLaunchIntent(getApplicationContext(), true, false);
                startActivityForResult(launchIntent, BARCODE_READER_ACTIVITY_REQUEST);
            }
        });
    }

    public void CarregarListaCompras() {

        //Listar tarefas
        CompraDAO compraDAO = new CompraDAO(getApplicationContext());
        listProdutos = compraDAO.listar();

        //Configurar ADAPTER

        listaCompraAdapter = new ListaCompraAdapter(listProdutos);

        //Configurar RECYCLERVIEW
        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(getApplicationContext());

        rcrvwListagemProduto.setLayoutManager(layoutManager);
        rcrvwListagemProduto.setHasFixedSize(true);

        /**https://www.udemy.com/curso-de-desenvolvimento-android-oreo/learn/lecture/9124084#questions/6267586**/
        //se ja tiver a linha de decoração ele remove e coloca novamnete para nao ficar criando
        // linha amais a cada refresh da activity
        while (rcrvwListagemProduto.getItemDecorationCount() > 0) {
            rcrvwListagemProduto.removeItemDecorationAt(0);
        }
        rcrvwListagemProduto.addItemDecoration(new DividerItemDecoration(getApplicationContext(), LinearLayout.VERTICAL));
        rcrvwListagemProduto.setAdapter(listaCompraAdapter);
    }//metodos para fazer a listagem dos produtos

    @Override
    protected void onStart() {
        //Exibe lista de produtos no RecyclerView
        CarregarListaCompras();
        super.onStart();
    }//sempre que starta a activit ele recarreca os produtos no recyclerView chamando o metodo CarregarListaCompras()


    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (resultCode != Activity.RESULT_OK) {
            Toast.makeText(this, "Erro ao Scannear", Toast.LENGTH_SHORT).show();
            return;
        }

        if (requestCode == BARCODE_READER_ACTIVITY_REQUEST && data != null) {
            Barcode barcode = data.getParcelableExtra(BarcodeReaderActivity.KEY_CAPTURED_BARCODE);

            if (edtxt_localizarPorNome.getText().toString().length()==0){
                edtxt_localizarPorNome.setText(barcode.rawValue);
            }else{
                edtxt_localizarPorNome.setText("");
                edtxt_localizarPorNome.setText(barcode.rawValue);

            }

        }

    }//leitura de codigo de barras

}

