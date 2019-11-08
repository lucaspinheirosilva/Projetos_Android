package com.example.anotacoessharedpref;


import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.google.android.material.button.MaterialButton;
import com.google.android.material.dialog.MaterialAlertDialogBuilder;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.textfield.TextInputEditText;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        MaterialButton btn_1 = findViewById(R.id.btn_1);
        MaterialButton btn_2 = findViewById(R.id.btn_2);
        MaterialButton btn_3 = findViewById(R.id.btn_3);
        MaterialButton btn_4 = findViewById(R.id.btn_4);
        MaterialButton btn_5 = findViewById(R.id.btn_5);
        MaterialButton btn_6 = findViewById(R.id.btn_6);
        MaterialButton btn_7 = findViewById(R.id.btn_7);
        MaterialButton btn_8 = findViewById(R.id.btn_8);
        MaterialButton btn_9 = findViewById(R.id.btn_9);
        MaterialButton btn_10 = findViewById(R.id.btn_10);


        FloatingActionButton fabGravar = findViewById(R.id.fab_gravar);
        FloatingActionButton fabCores = findViewById(R.id.fab_Cores);

        fabGravar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

            }
        });

        fabCores.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final MaterialAlertDialogBuilder buider = new MaterialAlertDialogBuilder(MainActivity.this);
                View mView = getLayoutInflater().inflate(R.layout.activity_custom_dialog, null);

                final TextInputEditText txt_anotacoes = findViewById(R.id.edtxt_anotacoes);

                MaterialButton btn_1 = mView.findViewById(R.id.btn_1);
                MaterialButton btn_2 = mView.findViewById(R.id.btn_2);
                MaterialButton btn_3 = mView.findViewById(R.id.btn_3);
                MaterialButton btn_4 = mView.findViewById(R.id.btn_4);
                MaterialButton btn_5 = mView.findViewById(R.id.btn_5);
                MaterialButton btn_6 = mView.findViewById(R.id.btn_6);
                MaterialButton btn_7 = mView.findViewById(R.id.btn_7);
                MaterialButton btn_8 = mView.findViewById(R.id.btn_8);
                MaterialButton btn_9 = mView.findViewById(R.id.btn_9);
                MaterialButton btn_10 = mView.findViewById(R.id.btn_10);

                btn_1.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        txt_anotacoes.setBackgroundColor(Color.parseColor("#7B68EE"));
                        txt_anotacoes.setTextColor(Color.parseColor("#ffffff"));
                    }
                });
                btn_2.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        txt_anotacoes.setBackgroundColor(Color.parseColor("#6495ED"));
                        txt_anotacoes.setTextColor(Color.parseColor("#ffffff"));
                    }
                });
                btn_3.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        txt_anotacoes.setBackgroundColor(Color.parseColor("#ADD8E6"));
                        txt_anotacoes.setTextColor(Color.parseColor("#000000"));
                    }
                });
                btn_4.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        txt_anotacoes.setBackgroundColor(Color.parseColor("#FFE4C4"));
                    }
                });
                btn_5.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        txt_anotacoes.setBackgroundColor(Color.parseColor("#D8BFD8"));
                    }
                });
                btn_6.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        txt_anotacoes.setBackgroundColor(Color.parseColor("#B0C4DE"));
                    }
                });
                btn_7.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        txt_anotacoes.setBackgroundColor(Color.parseColor("#7FFF00"));
                    }
                });
                btn_8.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        txt_anotacoes.setBackgroundColor(Color.parseColor("#F08080"));
                    }
                });
                btn_9.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        txt_anotacoes.setBackgroundColor(Color.parseColor("#BDB76B"));
                    }
                });
                btn_10.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        txt_anotacoes.setBackgroundColor(Color.parseColor("#006400"));
                    }
                });

                buider.setView(mView);
                buider.setTitle("Escolha a Cor de fundo das Notas:");
                buider.show();
            }
        });
    }
}
