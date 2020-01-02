package br.com.organizze.activity.activity;


import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthInvalidCredentialsException;
import com.google.firebase.auth.FirebaseAuthInvalidUserException;
import com.google.firebase.auth.FirebaseAuthUserCollisionException;
import com.google.firebase.auth.FirebaseAuthWeakPasswordException;

import java.util.Objects;

import br.com.organizze.R;
import br.com.organizze.activity.config.FirebaseConfiguracao;
import br.com.organizze.activity.model.Usuario;

public class LoginActivity extends AppCompatActivity {

    EditText email, senha;
    Button acessar;

    Usuario usuario;
    FirebaseAuth autenticacao;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.login);

        //VINCULAR IDs COM LAYOUT
        email = findViewById(R.id.edttxt_login_Email);
        senha = findViewById(R.id.edttxt_login_Senha);
        acessar = findViewById(R.id.btn_login_Acessar);


        acessar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String emailDigitado = email.getText().toString();
                String senhaDigitado = senha.getText().toString();

                if (!emailDigitado.isEmpty()) {
                    if (!senhaDigitado.isEmpty()) {

                        usuario = new Usuario();
                        usuario.setEmail(emailDigitado);
                        usuario.setSenha(senhaDigitado);
                        validarLogin();

                    } else {
                        Toast.makeText(getApplicationContext(),
                                "Preencha a Senha!",
                                Toast.LENGTH_SHORT).show();
                        senha.setError("Obrigatório");
                        senha.setFocusable(true);
                    }
                } else {
                    Toast.makeText(getApplicationContext(),
                            "Preencha o E-mail!",
                            Toast.LENGTH_SHORT).show();
                    email.setError("Obrigatório");
                    email.setFocusable(true);
                }
            }
        });


    }

    public void validarLogin() {
        autenticacao = FirebaseConfiguracao.getFirebaseAutenticacao();
        autenticacao.signInWithEmailAndPassword(
                usuario.getEmail(),
                usuario.getSenha()
        ).addOnCompleteListener(new OnCompleteListener <AuthResult>() {
            @Override
            public void onComplete(@NonNull Task <AuthResult> task) {
                if (task.isSuccessful()) {
                    abrirTelaPrincipal();
                } else {
                    //validação das excessoes do Firebase
                    String excessao = "";
                    try {
                        throw (task.getException());

                    } catch (FirebaseAuthInvalidCredentialsException e) {
                        excessao = "E-mail ou senha nao correnpode a um usuario cadastrado!";
                    } catch (FirebaseAuthInvalidUserException e) {
                        excessao = "Usuario não esta cadastrado!";
                    } catch (Exception e) {
                        excessao = "ERRO AO CADASTRAR, ERRO GENERICO" + e.getMessage().toUpperCase();
                        e.printStackTrace();
                    }

                    Toast.makeText(getApplicationContext(),
                            excessao,
                            Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    public void abrirTelaPrincipal() {
        Intent intent = new Intent(this, PrincialActivity.class);
        startActivity(intent);
    }


}
