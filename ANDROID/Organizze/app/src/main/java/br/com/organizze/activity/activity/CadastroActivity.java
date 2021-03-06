package br.com.organizze.activity.activity;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthInvalidCredentialsException;
import com.google.firebase.auth.FirebaseAuthUserCollisionException;
import com.google.firebase.auth.FirebaseAuthWeakPasswordException;

import br.com.organizze.R;
import br.com.organizze.activity.config.FirebaseConfiguracao;
import br.com.organizze.activity.helper.Base64Custom;
import br.com.organizze.activity.model.Usuario;

public class CadastroActivity extends AppCompatActivity {

    EditText nome, email, senha;
    Button gravarCadastro;
    FirebaseAuth autenticacao;
    // INSTANCIAR OUTRAS CLASSES
    Usuario usuario;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cadastro);

        //VINCULAR IDs COM LAYOUT
        nome = findViewById(R.id.edttxt_cadastro_Nome);
        email = findViewById(R.id.edttxt_cadastro_Email);
        senha = findViewById(R.id.edttxt_cadastro_Senha);
        gravarCadastro = findViewById(R.id.btn_cadastro_Gravar);


        gravarCadastro.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String nomeDigitado = nome.getText().toString();
                String emailDigitado = email.getText().toString();
                String senhaDigitado = senha.getText().toString();

                //validar se os campos foram preenchidos
                if (!nomeDigitado.isEmpty()) {
                    if (!emailDigitado.isEmpty()) {
                        if (!senhaDigitado.isEmpty()) {
                            usuario = new Usuario();
                            usuario.setEmail(emailDigitado);
                            usuario.setSenha(senhaDigitado);
                            usuario.setNome(nomeDigitado);
                            CadastrarUsuario();

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

                } else {
                    Toast.makeText(getApplicationContext(),
                            "Preencha o Nome!",
                            Toast.LENGTH_SHORT).show();
                    nome.setError("Obrigatório");
                    nome.setFocusable(true);
                }
            }
        });

    }

    public void CadastrarUsuario() {
        autenticacao = FirebaseConfiguracao.getFirebaseAutenticacao();
        autenticacao.createUserWithEmailAndPassword(
                usuario.getEmail(),
                usuario.getSenha()).
                addOnCompleteListener(new OnCompleteListener <AuthResult>() {
                    @Override
                    public void onComplete(@NonNull Task <AuthResult> task) {
                        if (task.isSuccessful()) {
                            String idUsuario = Base64Custom.codificarBase64(usuario.getEmail());
                            usuario.setIdUsuario(idUsuario);
                            usuario.Salvar();
                           finish();

                        } else {

                            //validação das excessoes do Firebase
                            String excessao = "";
                            try {
                                throw task.getException();

                            } catch (FirebaseAuthWeakPasswordException e) {
                                excessao = "Digite uma SENHA mais forte!";
                            } catch (FirebaseAuthInvalidCredentialsException e) {
                                excessao = "Por favor, digite um E-MAIL valido";
                            } catch (FirebaseAuthUserCollisionException e) {
                                excessao = "Esta E-MAIL ja foi cadastrado, use outro por favor";
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
}
