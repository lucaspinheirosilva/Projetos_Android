package br.com.organizze.activity.helper;

import android.util.Base64;

/**
 * Criado por Lucas Pinheiro on 05/01/2020.
 */
public class Base64Custom {
    public static String codificarBase64(String texto){

        texto = Base64.encodeToString(texto.getBytes(),Base64.DEFAULT).replaceAll("(\\n|\\r)","");
        return texto;
    }
    public static String decodificarBase64(String textoDecotificado){
        return (new String(Base64.decode(textoDecotificado,Base64.DEFAULT)));
    }
}
