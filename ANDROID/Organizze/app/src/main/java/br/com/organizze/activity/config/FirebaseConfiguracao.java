package br.com.organizze.activity.config;

import com.google.firebase.auth.FirebaseAuth;

/**
 * Criado por Lucas Pinheiro on 01/01/2020.
 */
public class FirebaseConfiguracao {

    private static FirebaseAuth autenticacao;

    //RETORNA A INSTANCIA DO FIREBASE
    public static FirebaseAuth getFirebaseAutenticacao() {
        if (autenticacao == null) {
            autenticacao = FirebaseAuth.getInstance();
        }
        return autenticacao;

    }
}
