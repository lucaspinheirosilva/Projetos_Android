package com.example.listview;

import android.app.ListActivity;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.Toast;

import java.util.List;

public class MainActivity extends ListActivity {


    /**Preparar o conteudo da lista
     //Array de String's,
     //Nomes das Cidades - UF.*/
    String[] cidades = new String[]{
            "Acre - (AC)",
            "Alagoas - AL)",
            "Amapá - (AP)",
            "Amazonas - (AM)",
            "Bahia - (BA)",
            "Ceará - (CE)",
            "Distrito Fe,deral - (DF)",
            "Espírito Santo - (ES)",
            "Goiás - (GO)",
            "Maranhão - (MA)",
            "Mato Grosso - (MT)",
            "Mato Grosso do Sul - (MS)",
            "Minas Gerais - (MG)",
            "Pará - (PA)",
            "Paraíba - (PB)",
            "Paraná - (PR)",
            "Pernambuco - (PE)",
            "Piauí - (PI)",
            "Rio de Janeiro - (RJ)",
            "Rio Grande do Norte - (RN)",
            "Rio Grande do Sul - (RS)",
            "Rondônia - (RO)",
            "Roraima - (RR)",
            "Santa Catarina - (SC)",
            "São Paulo - (SP)",
            "Sergipe - (SE)",
            "Tocantins - (TO)"

    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        //PRIMEIRO PASSO >>> criar Adapter
        setListAdapter(new ArrayAdapter<String>(this,
                R.layout.activity_main,cidades));

        //SEGUNDO PASSO >>> Setar a Lista ao Layout
        ListView cidadeListView = getListView();

        //TERCEIRO PASSO >>> pegar o Click;
        cidadeListView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView <?> parent, View view, int position, long id) {
                //QUARTO PASSO >>>  tratar as informaçoes do click
                Toast.makeText(getApplicationContext(),"CIDADE >> "+cidades[position],
                        Toast.LENGTH_SHORT).show();
            }
        });
    }
}
