package br.com.organizze.activity.helper;

import java.text.SimpleDateFormat;

/**
 * Criado por Lucas Pinheiro on 05/01/2020.
 */

public class DataCustom {
    public static String dataAtual(){
        long data = System.currentTimeMillis();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
        String dataString = simpleDateFormat.format(data);
        return dataString;
    }
}
//https://developer.android.com/reference/java/text/SimpleDateFormat