package com.example.calculomoedas;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    TextView txtvwCincoCents;
    TextView txtvwDezCents;
    TextView txtvwVinteCincoCents;
    TextView txtvwCinquentaCents;
    TextView txtvwUmReal;
    TextView txtvwTotal;
    TextView txtvwTotal2;

    EditText edtxtCincoCents;
    EditText edtxtDezCents;
    EditText edtxtVinteCincoCents;
    EditText edtxtCinquentaCents;
    EditText edtxtUmReal;

    float valTotal;
    float valTotal2;
    float media_cinco;
    float media_Dez;
    float media_VinteCinco;
    float media_Cinquenta;
    float media_Um;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_main);

        txtvwCincoCents = findViewById(R.id.txtvw5cents);
        txtvwDezCents = findViewById(R.id.txtvw10cents);
        txtvwVinteCincoCents = findViewById(R.id.txtvw25cents);
        txtvwCinquentaCents = findViewById(R.id.txtvw50cents);
        txtvwUmReal = findViewById(R.id.txtvw1real);
        txtvwTotal = findViewById(R.id.txtvw_totalcalculado);
        txtvwTotal2 = findViewById(R.id.txtvw_totalcalculado2);

        edtxtCincoCents = findViewById(R.id.edtxt5cents);
        edtxtDezCents = findViewById(R.id.edtxt10cents);
        edtxtVinteCincoCents = findViewById(R.id.edtxt25cents);
        edtxtCinquentaCents = findViewById(R.id.edtxt50cents);
        edtxtUmReal = findViewById(R.id.edtxt1real);

        calculoCinco();
        calculoDez();
        calculoVinteCinco();
        calculoCinquenta();
        calculoUm();
    }
    public void calculoCinco(){
        edtxtCincoCents.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

                if (edtxtCincoCents.getText().toString().length()==0){
                    txtvwCincoCents.setText("0,00");
                    media_cinco=0;
                    calculoTotal();



                }else {

                    int valorDigitado_Cinco = Integer.parseInt(edtxtCincoCents.getText().toString());

                    media_cinco = (float) (valorDigitado_Cinco * 0.05);

                    if (media_cinco<1.0) {
                        txtvwCincoCents.setText(String.valueOf("R$: " + media_cinco + " Centavos"));
                        calculoTotal();
                    }else if (media_cinco==1.0){
                        txtvwCincoCents.setText(String.valueOf("R$: "+media_cinco+" Real"));
                        calculoTotal();
                    }
                    else{
                        txtvwCincoCents.setText(String.valueOf("R$: "+media_cinco+" Reais"));
                        calculoTotal();
                    }
                }
            }

            @Override
            public void afterTextChanged(Editable s) {


            }
        });

    }

    public void calculoDez(){
        edtxtDezCents.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                if (edtxtDezCents.getText().toString().length() == 0) {
                    txtvwDezCents.setText("0,00");
                    media_Dez=0;
                    calculoTotal();

                } else {

                    int valorDigitado_Dez = Integer.parseInt(edtxtDezCents.getText().toString());

                    media_Dez  = (float) (valorDigitado_Dez * 0.10);

                    if (media_Dez<1.0) {
                        txtvwDezCents.setText(String.valueOf("R$: "+media_Dez + " Centavos"));
                        calculoTotal();
                    }else if (media_Dez==1.0){
                        txtvwDezCents.setText(String.valueOf("R$: "+media_Dez+" Real"));
                        calculoTotal();
                    }
                    else{
                        txtvwDezCents.setText(String.valueOf("R$: "+media_Dez+" Reais"));
                        calculoTotal();
                    }
                }
            }
            @Override
            public void afterTextChanged(Editable s) {

            }
        });

    }

    public void calculoVinteCinco(){
        edtxtVinteCincoCents.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                if (edtxtVinteCincoCents.getText().toString().length()==0) {
                    txtvwVinteCincoCents.setText("0,00");
                    media_VinteCinco=0;
                    calculoTotal();
                }else{

                    int valorDigitado_VinteCinco = Integer.parseInt(edtxtVinteCincoCents.getText().toString());

                    media_VinteCinco = (float) (valorDigitado_VinteCinco * 0.25);

                    if (media_VinteCinco<1.0) {
                        txtvwVinteCincoCents.setText(String.valueOf("R$: "+media_VinteCinco+ " Centavos"));
                        calculoTotal();
                    }else if (media_VinteCinco==1.0){
                        txtvwVinteCincoCents.setText(String.valueOf("R$: "+media_VinteCinco+" Real"));
                        calculoTotal();
                    }
                    else{
                        txtvwVinteCincoCents.setText(String.valueOf("R$: "+media_VinteCinco+" Reais"));
                        calculoTotal();
                    }

                }
            }

            @Override
            public void afterTextChanged(Editable s) {

            }
        });

    }

    public void calculoCinquenta(){
        edtxtCinquentaCents.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

                if (edtxtCinquentaCents.getText().toString().length()==0){
                    txtvwCinquentaCents.setText("0,00");
                    media_Cinquenta=0;
                    calculoTotal();

                }else {
                    int valorDigitado_Cinquenta = Integer.parseInt(edtxtCinquentaCents.getText().toString());

                    media_Cinquenta = (float) (valorDigitado_Cinquenta * 0.50);

                    if (media_Cinquenta<1.0) {
                        txtvwCinquentaCents.setText(String.valueOf("R$: "+media_Cinquenta+ " Centavos"));
                        calculoTotal();
                    }else if (media_Cinquenta==1.0){
                        txtvwCinquentaCents.setText(String.valueOf("R$: "+media_Cinquenta+" Real"));
                        calculoTotal();
                    }
                    else{
                        txtvwCinquentaCents.setText(String.valueOf("R$: "+media_Cinquenta+" Reais"));
                        calculoTotal();
                    }

                }
            }

            @Override
            public void afterTextChanged(Editable s) {

            }
        });

    }

    public void calculoUm(){
        edtxtUmReal.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                if (edtxtUmReal.getText().toString().length()==0){
                    txtvwUmReal.setText("0,00");
                    media_Um=0;
                    calculoTotal();
                }else {

                    int valorDigitado_Um = Integer.parseInt(edtxtUmReal.getText().toString());

                    media_Um = (float) (valorDigitado_Um * 1.00);

                    if (media_Um==1.0){
                        txtvwUmReal.setText(String.valueOf("R$: "+media_Um+" Real"));
                        calculoTotal();
                    }
                    else{
                        txtvwUmReal.setText(String.valueOf("R$: "+media_Um+" Reais"));
                        calculoTotal();
                    }

                }

            }

            @Override
            public void afterTextChanged(Editable s) {


            }
        });

    }

    public  void calculoTotal(){
        valTotal = (media_cinco+media_Dez+media_VinteCinco+media_Cinquenta+media_Um);
        valTotal2 = valTotal;

        if (valTotal ==0){
            txtvwTotal.setText(String.valueOf("R$: "+valTotal));
            txtvwTotal2.setText(String.valueOf("R$: "+valTotal2));
        }else if (valTotal<1.0){
            txtvwTotal.setText(String.valueOf("R$: "+valTotal+" Centavos"));
            txtvwTotal2.setText(String.valueOf("R$: "+valTotal2+" Centavos"));
        }else if (valTotal==1.0){
            txtvwTotal.setText(String.valueOf("R$: "+valTotal+" Real"));
            txtvwTotal2.setText(String.valueOf("R$: "+valTotal2+" Real"));
        }else{
            txtvwTotal.setText(String.valueOf("R$: "+valTotal+" Reais"));
            txtvwTotal2.setText(String.valueOf("R$: "+valTotal2+" Reais"));
        }


    }

}
