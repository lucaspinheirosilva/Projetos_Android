package br.com.listacompras.activity;

import android.app.Activity;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.util.SparseArray;
import android.view.View;
import android.widget.AutoCompleteTextView;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.Toast;

import com.google.android.gms.vision.barcode.Barcode;
import com.notbytes.barcode_reader.BarcodeReaderActivity;
import com.notbytes.barcode_reader.BarcodeReaderFragment;

import java.util.List;

import br.com.listacompras.R;
import br.com.listacompras.helper.CompraDAO;
import br.com.listacompras.model.ListaCompra;


public class AddListaProdutoActivity extends AppCompatActivity implements BarcodeReaderFragment.BarcodeReaderListener {

    //**VARIAVEIS****
    FloatingActionButton fabCancelarProduto;
    FloatingActionButton fabGravarProduto;
    FloatingActionButton fabDeletarProduto;

    ImageButton botaoBiparCodBar;

    EditText nomeProd;
    EditText marcaProd;
    EditText codBarProd;
    AutoCompleteTextView categoriaProd;

    ListaCompra produtoAtual;

    //CONTANTES
    private static final int BARCODE_READER_ACTIVITY_REQUEST = 1208;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_lista);

        getSupportActionBar().setTitle("Inclusão de Produto");//altera o titulo da tela

        //***INSTANCIAR OUTRAS CLASSES*****
        final CompraDAO compraDAO = new CompraDAO(getApplicationContext());
        final ListaCompra listaCompra = new ListaCompra();

        //***SETAR VARIAVEIS COM ids DOS COMPONENTES*****
        fabCancelarProduto = findViewById(R.id.fab_cancelar);
        fabGravarProduto = findViewById(R.id.fab_GravarProduto);
        fabDeletarProduto = findViewById(R.id.fab_excluir);
        nomeProd = findViewById(R.id.edtxt_nomeProd);
        marcaProd = findViewById(R.id.edtxt_marcaProd);
        codBarProd = findViewById(R.id.edtxt_codBarProd);
        categoriaProd = findViewById(R.id.edtxt_categoriaProd);
        botaoBiparCodBar = findViewById(R.id.btn_biparProduto);


        fabDeletarProduto.hide();//deixa o floatButton DELETAR INVISIVEL

        //Recuperar produto caso seja edição.
        produtoAtual = (ListaCompra) getIntent().getSerializableExtra("produtoSelecionado");

        //Configurar produto na caixa de texto
        if (produtoAtual != null) {

            getSupportActionBar().setTitle("Alteração produto selecionado");//altera o titulo da tela
            fabDeletarProduto.show();//torna ele visivel novamente se for na tela de edição

            nomeProd.setText(produtoAtual.getNomeProduto());
            marcaProd.setText(produtoAtual.getMarcaProduto());
            codBarProd.setText(produtoAtual.getCodBarProduto());
            categoriaProd.setText(produtoAtual.getCategoriaProduto());
        }

        //***FloatButton GRAVAR PRODUTO****//
        fabGravarProduto.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String produto = nomeProd.getText().toString();
                String marca = marcaProd.getText().toString();
                String codigoBarras = codBarProd.getText().toString();
                String categoria = categoriaProd.getText().toString();

                if (produtoAtual != null) { //EDIÇÃO
                    try {
                        if (produto.length() < 3) {
                            nomeProd.setFocusable(true);
                            nomeProd.setError("Minimo 3 letras");
                        } else if (marca.length() < 3) {
                            marcaProd.setFocusable(true);
                            marcaProd.setError("Minimo 3 letras");
                        } else if (categoria.length() < 3) {
                            categoriaProd.setFocusable(true);
                            categoriaProd.setError("Minimo 3 letras");
                        } else {

                            listaCompra.setId(produtoAtual.getId());
                            listaCompra.setNomeProduto(produto);
                            listaCompra.setMarcaProduto(marca);
                            listaCompra.setCodBarProduto(codigoBarras);
                            listaCompra.setCategoriaProduto(categoria);

                            compraDAO.atualizar(listaCompra);

                            Toast.makeText(getApplicationContext(), "Produto ATUALIZADO com sucesso", Toast.LENGTH_LONG).show();
                            finish();
                        }
                    } catch (Exception erro) {
                        Toast.makeText(getApplicationContext(), "ERRO AO ATUALIZAR " + erro.getMessage(), Toast.LENGTH_LONG).show();
                    }

                } else //SALVAR
                {
                    try {
                        if (produto.length() < 3) {
                            nomeProd.setFocusable(true);
                            nomeProd.setError("Minimo 3 letras");
                        } else if (marca.length() < 3) {
                            marcaProd.setFocusable(true);
                            marcaProd.setError("Minimo 3 letras");
                        } else if (categoria.length() < 3) {
                            categoriaProd.setFocusable(true);
                            categoriaProd.setError("Minimo 3 letras");
                        } else {

                            listaCompra.setNomeProduto(produto);
                            listaCompra.setMarcaProduto(marca);
                            listaCompra.setCodBarProduto(codigoBarras);
                            listaCompra.setCategoriaProduto(categoria);

                            compraDAO.salvar(listaCompra);

                            Toast.makeText(getApplicationContext(), "Adicionado com Sucesso!!", Toast.LENGTH_LONG).show();

                            finish();
                        }
                    } catch (Exception erro) {
                        Toast.makeText(getApplicationContext(), "ERRO AO SALVAR " + erro.getMessage(), Toast.LENGTH_LONG).show();
                    }
                }
            }
        });

        //***FloatButton VOLTAR****//
        fabCancelarProduto.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });

        //***FloatButton DELETAR****//
        fabDeletarProduto.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                AlertDialog.Builder builder = new AlertDialog.Builder(AddListaProdutoActivity.this);
                builder.setTitle("Confirmar Exclusão");
                builder.setMessage("Deseja Excluir o produto " + produtoAtual.getNomeProduto() + " " + produtoAtual.getMarcaProduto() + " ?");
                builder.setPositiveButton("SIM", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {

                        if (produtoAtual != null) {
                            compraDAO.deletar(produtoAtual);
                            Toast.makeText(getApplicationContext(), "Excluido com Sucesso!!", Toast.LENGTH_LONG).show();
                            finish();
                        } else {
                            Toast.makeText(getApplicationContext(), "ERRO AO EXCLUIR!!", Toast.LENGTH_LONG).show();
                            Log.i("ERRO", "ERRO AO EXCLUIR!!");

                        }
                    }
                });
                builder.setNegativeButton("NÃO", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.cancel();
                    }
                });
                builder.create();
                builder.show();

            }
        });
        //***BOTÃO PARA LER CODIGO DE BARRAS****//
        botaoBiparCodBar.setOnClickListener(new View.OnClickListener() {
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

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (resultCode != Activity.RESULT_OK) {
            //  Toast.makeText(this, "", Toast.LENGTH_SHORT).show();
            return;
        }

        if (requestCode == BARCODE_READER_ACTIVITY_REQUEST && data != null) {
            Barcode barcode = data.getParcelableExtra(BarcodeReaderActivity.KEY_CAPTURED_BARCODE);
            Toast.makeText(this, barcode.rawValue, Toast.LENGTH_SHORT).show();
            //mTvResultHeader.setText("On Activity Result");
            if (codBarProd.getText().toString().length() == 0) {
                codBarProd.setText(barcode.rawValue);
            } else {
                codBarProd.setText("");
                codBarProd.setText(barcode.rawValue);

            }

        }

    }

    @Override
    public void onScanned(Barcode barcode) {

    }

    @Override
    public void onScannedMultiple(List <Barcode> barcodes) {

    }

    @Override
    public void onBitmapScanned(SparseArray <Barcode> sparseArray) {

    }

    @Override
    public void onScanError(String errorMessage) {

    }

    @Override
    public void onCameraPermissionDenied() {

    }
}
