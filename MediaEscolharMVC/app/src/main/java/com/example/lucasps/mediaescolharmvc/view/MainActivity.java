package com.example.lucasps.mediaescolharmvc.view;

import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.NavigationView;
import android.support.design.widget.Snackbar;
import android.support.v4.app.FragmentManager;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Toast;

import com.example.lucasps.mediaescolharmvc.R;
import com.example.lucasps.mediaescolharmvc.fragments.Fragment_primeiroBim;
import com.example.lucasps.mediaescolharmvc.fragments.Fragment_quartoBim;
import com.example.lucasps.mediaescolharmvc.fragments.Fragment_resultadoFinal;
import com.example.lucasps.mediaescolharmvc.fragments.Fragment_segundoBim;
import com.example.lucasps.mediaescolharmvc.fragments.Fragment_terceiroBim;
import com.example.lucasps.mediaescolharmvc.fragments.ModeloFragment;

import java.text.DecimalFormat;

public class  MainActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {



    //FAZ O IMPORT DA CLASSE FRAGMENT MANEGER PARA CHAMAR O FRAGMENT
    FragmentManager fragmentManager;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            setContentView(R.layout.activity_main);
            Toolbar toolbar =findViewById(R.id.toolbar);
            setSupportActionBar(toolbar);

            FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
            fab.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                            .setAction("Action", null).show();
                }
            });

            DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
            ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                    this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
            drawer.addDrawerListener(toggle);



            toggle.syncState();


            NavigationView navigationView =findViewById(R.id.nav_view);
            navigationView.setNavigationItemSelectedListener(this);




            //instancio o objeto para nao dar o erro ATTEMP NULL EBJECT......
           fragmentManager = getSupportFragmentManager();

            //CHAMA O SUPORTE A CLASSE FRAGMENT MANEGER
            fragmentManager.beginTransaction().replace(R.id.content_fragment,new ModeloFragment()).commit();

        }catch (Exception erro){
            Toast.makeText(getApplicationContext(),erro.getMessage(),Toast.LENGTH_LONG).show();
        }
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);

        } else {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();

        if (id == R.id.action_sair) {
            finish();
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if (id == R.id.nav_primeiro_BimestreID) {
            setTitle("1º-Bimestre");
            //CHAMA O FRAGMENT atravez do ID
            fragmentManager.beginTransaction().replace(R.id.content_fragment,new Fragment_primeiroBim()).commit();

        } else if (id == R.id.nav_segundo_BimestreID) {
            setTitle("2º-Bimestre");
            //CHAMA O FRAGMENT atravez do ID
            fragmentManager.beginTransaction().replace(R.id.content_fragment,new Fragment_segundoBim()).commit();

        } else if (id == R.id.nav_terceiro_BimestreID) {
            setTitle("3º-Bimestre");
            //CHAMA O FRAGMENT atravez do ID
            fragmentManager.beginTransaction().replace(R.id.content_fragment,new Fragment_terceiroBim()).commit();

        } else if (id == R.id.nav_quarto_BimestreID) {
            setTitle("4º-Bimestre");
            //CHAMA O FRAGMENT atravez do ID
            fragmentManager.beginTransaction().replace(R.id.content_fragment,new Fragment_quartoBim()).commit();

        } else if (id == R.id.nav_resultadoFinal_ID) {
            setTitle("Resultado Final");
            //CHAMA O FRAGMENT atravez do ID
            fragmentManager.beginTransaction().replace(R.id.content_fragment,new Fragment_resultadoFinal()).commit();

        } else if (id == R.id.compartilharAppID) {

        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);


        return true;
    }

    public static String formatarDecimal(Double valor){
        DecimalFormat df = new DecimalFormat("#,###,##0.00");
        return df.format(valor);
    }

}
