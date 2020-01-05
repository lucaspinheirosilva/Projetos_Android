package br.com.organizze.activity.activity;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.TextView;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.textfield.TextInputEditText;

import br.com.organizze.R;
import br.com.organizze.activity.helper.DataCustom;

public class DespesasActivity extends AppCompatActivity {

    TextInputEditText data,descricao,categoria;
    TextView total;
    FloatingActionButton fab_confirmar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_despesas);

        //vincular ids com componentes da tela
        data = findViewById(R.id.txtImptEdttxt_despesa_data);
        descricao = findViewById(R.id.txtImptEdttxt_despesa_descricao);
        categoria = findViewById(R.id.txtImptEdttxt_despesa_categoria);
        total = findViewById(R.id.txtvw_despesa_total);
        fab_confirmar = findViewById(R.id.fab_despesa_confirmar);

        data.setText(DataCustom.dataAtual());
    }
}
