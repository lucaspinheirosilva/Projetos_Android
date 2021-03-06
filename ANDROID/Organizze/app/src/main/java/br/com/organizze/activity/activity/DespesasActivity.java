package br.com.organizze.activity.activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.coordinatorlayout.widget.CoordinatorLayout;

import android.os.Bundle;
import android.text.Editable;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;
import com.google.android.material.textfield.TextInputEditText;

import br.com.organizze.R;
import br.com.organizze.activity.helper.DataCustom;
import br.com.organizze.activity.model.Movimentacao;

public class DespesasActivity extends AppCompatActivity {

    TextInputEditText data, descricao, categoria;
    EditText valor;
    FloatingActionButton fab_confirmar;
    Movimentacao movimentacao;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_despesas);

        //vincular ids com componentes da tela
        data = findViewById(R.id.txtImptEdttxt_despesa_data);
        descricao = findViewById(R.id.txtImptEdttxt_despesa_descricao);
        categoria = findViewById(R.id.txtImptEdttxt_despesa_categoria);
        valor = findViewById(R.id.edtxt_valor_despesa);
        fab_confirmar = findViewById(R.id.fab_despesa_confirmar);

        data.setText(DataCustom.dataAtual());

        fab_confirmar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                if (validarCamposDespesas()) {
                    movimentacao = new Movimentacao();
                    movimentacao.setValor(Double.parseDouble(valor.getText().toString()));
                    movimentacao.setCategoria(categoria.getText().toString());
                    movimentacao.setDescricao(descricao.getText().toString());
                    movimentacao.setData(data.getText().toString());
                    movimentacao.setTipo("d");

                    movimentacao.Salvar(data.getText().toString());
                }

            }
        });

    }

    public Boolean validarCamposDespesas() {

        String valorDigitado = valor.getText().toString();
        String dataDigitado = data.getText().toString();
        String categoriaDigitado = categoria.getText().toString();
        String descricaoDigitado = descricao.getText().toString();


        if (!valorDigitado.isEmpty()) {
            if (!dataDigitado.isEmpty()) {
                if (!descricaoDigitado.isEmpty()) {
                    if (!categoriaDigitado.isEmpty()) {
                        return true;
                    } else {
                        Toast.makeText(getApplicationContext(),
                                "Informe a Categoria",
                                Toast.LENGTH_LONG).show();
                        categoria.setError("*");
                        return false;
                    }

                } else {
                    Toast.makeText(getApplicationContext(),
                            "Informe a Descrição",
                            Toast.LENGTH_LONG).show();
                    descricao.setError("*");
                    return false;
                }
            } else {
                Toast.makeText(getApplicationContext(),
                        "Informe a Data",
                        Toast.LENGTH_LONG).show();
                data.setError("*");
                return false;
            }

        } else {
            Toast.makeText(getApplicationContext(),
                    "Informe o Valor",
                    Toast.LENGTH_LONG).show();
            valor.setError("*");
            return false;
        }


    }

}
