package br.com.organizze.activity.helper;

import java.text.SimpleDateFormat;

/**
 * Criado por Lucas Pinheiro on 05/01/2020.
 */

public class DataCustom {
    public static String dataAtual() {
        //https://developer.android.com/reference/java/text/SimpleDateFormat
        long data = System.currentTimeMillis();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
        String dataString = simpleDateFormat.format(data);
        return dataString;
    }

    public static String MesAnoDataAtual(String data) {
        String retornoData[] = dataAtual().split("/");
        String dia = retornoData[0];
        String mes = retornoData[1];
        String ano = retornoData[2];

        String mesAno = mes + ano;

        return mesAno;

    }
}
