package br.com.anotaoes;

import android.graphics.Color;
import android.os.Bundle;
import android.support.constraint.ConstraintLayout;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    //todo: Tentar Criar como Stick(WIDGET) no celular para a elaine.


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final EditText edtxt_anotacoes = findViewById(R.id.edttxt_texto);
        final ImageView img_logo = findViewById(R.id.imgvw_logo);
        final ConstraintLayout layout = findViewById(R.id.cl_LayoutPrimario);


        //fab SALVAR SHARED
        FloatingActionButton fab_gravar = findViewById(R.id.fab_gravar);
        fab_gravar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //salvar com Shared Preference
            }
        });
        //COR DO TEMA
        FloatingActionButton fab_corFundo = findViewById(R.id.fab_cores_fundo);
        fab_corFundo.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
                View dView = getLayoutInflater().inflate(R.layout.activity_dialog_cor_fundo, null);

                TextView textDialog = dView.findViewById(R.id.txtvw_tituloDialogTema);
                Button btn1 = dView.findViewById(R.id.btn_1);
                Button btn2 = dView.findViewById(R.id.btn_2);
                Button btn3 = dView.findViewById(R.id.btn_3);
                Button btn4 = dView.findViewById(R.id.btn_4);
                Button btn5 = dView.findViewById(R.id.btn_5);
                Button btn6 = dView.findViewById(R.id.btn_6);
                Button btn7 = dView.findViewById(R.id.btn_7);
                Button btn8 = dView.findViewById(R.id.btn_8);
                Button btn9 = dView.findViewById(R.id.btn_9);
                Button btn10 = dView.findViewById(R.id.btn_10);
                Button btn11 = dView.findViewById(R.id.btn_11);
                Button btn12 = dView.findViewById(R.id.btn_12);
                textDialog.setText("Escolha a Cor do Tema:");

                btn1.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setBackgroundColor(Color.parseColor("#7B68EE"));
                        img_logo.setBackgroundColor(Color.parseColor("#9082e5"));
                        layout.setBackgroundColor(Color.parseColor("#492eea"));
                    }
                });
                btn2.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setBackgroundColor(Color.parseColor("#6495ED"));
                        img_logo.setBackgroundColor(Color.parseColor("#8eade2"));
                        layout.setBackgroundColor(Color.parseColor("#3e7ff2"));

                    }
                });
                btn3.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setBackgroundColor(Color.parseColor("#ADD8E6"));
                        img_logo.setBackgroundColor(Color.parseColor("#bccfd6"));
                        layout.setBackgroundColor(Color.parseColor("#7ec6dd"));
                    }
                });
                btn4.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setBackgroundColor(Color.parseColor("#FFE4C4"));
                        img_logo.setBackgroundColor(Color.parseColor("#fff6ed"));
                        layout.setBackgroundColor(Color.parseColor("#f9d5a9"));
                    }
                });
                btn5.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setBackgroundColor(Color.parseColor("#D8BFD8"));
                        img_logo.setBackgroundColor(Color.parseColor("#d8d0d8"));
                        layout.setBackgroundColor(Color.parseColor("#d39cd3"));
                    }
                });
                btn6.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setBackgroundColor(Color.parseColor("#B0C4DE"));
                        img_logo.setBackgroundColor(Color.parseColor("#bbc4ce"));
                        layout.setBackgroundColor(Color.parseColor("#92b2db"));
                    }
                });
                btn7.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setBackgroundColor(Color.parseColor("#7FFF00"));
                        img_logo.setBackgroundColor(Color.parseColor("#a1f252"));
                        layout.setBackgroundColor(Color.parseColor("#67d100"));
                    }
                });
                btn8.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setBackgroundColor(Color.parseColor("#F08080"));
                        img_logo.setBackgroundColor(Color.parseColor("#e09696"));
                        layout.setBackgroundColor(Color.parseColor("#ef6262"));
                    }
                });
                btn9.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setBackgroundColor(Color.parseColor("#BDB76B"));
                        img_logo.setBackgroundColor(Color.parseColor("#b2ad74"));
                        layout.setBackgroundColor(Color.parseColor("#b2ab52"));
                    }
                });
                btn10.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setBackgroundColor(Color.parseColor("#006400"));
                        img_logo.setBackgroundColor(Color.parseColor("#0b930b"));
                        layout.setBackgroundColor(Color.parseColor("#003d00"));
                    }
                });
                btn11.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setBackgroundColor(Color.parseColor("#ffffff"));
                        img_logo.setBackgroundColor(Color.parseColor("#f9f9f9"));
                        layout.setBackgroundColor(Color.parseColor("#ededed"));
                    }
                });
                btn12.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setBackgroundColor(Color.parseColor("#333232"));
                        img_logo.setBackgroundColor(Color.parseColor("#4f4e4e"));
                        layout.setBackgroundColor(Color.parseColor("#232222"));
                    }
                });

                builder.setView(dView);
                AlertDialog dialog = builder.create();
                dialog.show();
            }
        });

        //COR DA FONTE
        FloatingActionButton fab_corFonte = findViewById(R.id.fab_corFonte);
        fab_corFonte.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
                View dView = getLayoutInflater().inflate(R.layout.activity_dialog_cor_fundo, null);

                TextView textDialog = dView.findViewById(R.id.txtvw_tituloDialogTema);
                Button btn1 = dView.findViewById(R.id.btn_1);
                Button btn2 = dView.findViewById(R.id.btn_2);
                Button btn3 = dView.findViewById(R.id.btn_3);
                Button btn4 = dView.findViewById(R.id.btn_4);
                Button btn5 = dView.findViewById(R.id.btn_5);
                Button btn6 = dView.findViewById(R.id.btn_6);
                Button btn7 = dView.findViewById(R.id.btn_7);
                Button btn8 = dView.findViewById(R.id.btn_8);
                Button btn9 = dView.findViewById(R.id.btn_9);
                Button btn10 = dView.findViewById(R.id.btn_10);
                Button btn11 = dView.findViewById(R.id.btn_11);
                Button btn12 = dView.findViewById(R.id.btn_12);
                textDialog.setText("Escolha a Cor da Fonte:");

                btn1.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setTextColor(Color.parseColor("#7B68EE"));
                    }
                });
                btn2.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setTextColor(Color.parseColor("#6495ED"));
                    }
                });
                btn3.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setTextColor(Color.parseColor("#ADD8E6"));
                    }
                });
                btn4.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setTextColor(Color.parseColor("#FFE4C4"));
                    }
                });
                btn5.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setTextColor(Color.parseColor("#D8BFD8"));
                    }
                });
                btn6.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setTextColor(Color.parseColor("#B0C4DE"));
                    }
                });
                btn7.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setTextColor(Color.parseColor("#7FFF00"));
                    }
                });
                btn8.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setTextColor(Color.parseColor("#F08080"));
                    }
                });
                btn9.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setTextColor(Color.parseColor("#BDB76B"));
                    }
                });
                btn10.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setTextColor(Color.parseColor("#006400"));
                    }
                });
                btn11.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setTextColor(Color.parseColor("#ffffff"));
                    }
                });
                btn12.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        edtxt_anotacoes.setTextColor(Color.parseColor("#333232"));
                    }
                });

                builder.setView(dView);
                AlertDialog dialog = builder.create();
                dialog.show();
            }
        });
    }

}
