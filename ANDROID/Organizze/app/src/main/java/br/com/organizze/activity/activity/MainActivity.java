package br.com.organizze.activity.activity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import com.google.firebase.auth.FirebaseAuth;
import com.heinrichreimersoftware.materialintro.app.IntroActivity;
import com.heinrichreimersoftware.materialintro.slide.FragmentSlide;

import br.com.organizze.R;
import br.com.organizze.activity.config.FirebaseConfiguracao;

public class MainActivity extends IntroActivity {

    FirebaseAuth autenticacao;

    /**
     * https://github.com/heinrichreimer/material-intro
     **/

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        /**setContentView(R.layout.activity_main);**/

        //****CARREGA OS DADOS DA INTRO***//
        setFullscreen(true);
        setButtonBackVisible(false);
        setButtonNextVisible(false);
        CarregarIntro();

    }

    public void CarregarIntro() {
        addSlide(new FragmentSlide.Builder()
                .background(R.color.intro_1)
                .fragment(R.layout.intro_1)
                .build());
        addSlide(new FragmentSlide.Builder()
                .background(R.color.intro_2)
                .fragment(R.layout.intro_2)
                .build());
        addSlide(new FragmentSlide.Builder()
                .background(R.color.intro_3)
                .fragment(R.layout.intro_3)
                .build());
        addSlide(new FragmentSlide.Builder()
                .background(R.color.intro_4)
                .fragment(R.layout.intro_4)
                .build());
        addSlide(new FragmentSlide.Builder()
                .background(R.color.intro_cadastro)
                .fragment(R.layout.intro_5)
                .canGoForward(false)
                .build());

    }

    public void onStart() {
        super.onStart();
        verificarUsuarioLogado();
    }

    public void btnCadastrar(View view) {
        startActivity(new Intent(this, cadastro.class));

    }

    public void txtvwJaTenhoConta(View view) {
        startActivity(new Intent(MainActivity.this, LoginActivity.class));
    }

    public void verificarUsuarioLogado() {
        autenticacao = FirebaseConfiguracao.getFirebaseAutenticacao();

        if (autenticacao.getCurrentUser() != null) {
            abrirTelaPrincipal();
        }
    }

    public void abrirTelaPrincipal() {
        Intent intent = new Intent(this, PrincialActivity.class);
        startActivity(intent);
    }


}
