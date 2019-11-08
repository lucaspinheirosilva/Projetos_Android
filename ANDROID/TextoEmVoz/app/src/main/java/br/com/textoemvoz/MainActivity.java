package br.com.textoemvoz;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.speech.tts.TextToSpeech;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.Toast;

import java.util.Locale;

public class MainActivity extends AppCompatActivity {

    /**https://javapapers.com/android/android-text-to-speech-tutorial/      **/

    ImageButton Reproduzir;
    EditText TextoDigitado;
    private TextToSpeech textToSpeech;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Reproduzir = findViewById(R.id.imgbtn_speaker);
        TextoDigitado = findViewById(R.id.edtxt_textoDigitado);


        textToSpeech = new TextToSpeech(getApplicationContext(), new TextToSpeech.OnInitListener() {
            @Override
            public void onInit(int status) {
                if (status == TextToSpeech.SUCCESS) {
                    //int ttsLang = textToSpeech.setLanguage(Locale.US);
                    int ttsLang = textToSpeech.setLanguage(new Locale("pt","BR"));

                    if (ttsLang == TextToSpeech.LANG_MISSING_DATA
                            || ttsLang == TextToSpeech.LANG_NOT_SUPPORTED) {
                        Log.e("TTS", "a Linguagem nao é suportada!");
                    } else {
                        Log.i("TTS", "Lingua suportada.");
                    }
                    Log.i("TTS", "Inicializado com Sucesso.");
                } else {
                    Toast.makeText(getApplicationContext(), "TTS Falha de Inicialização!", Toast.LENGTH_SHORT).show();
                }
            }
        });

        Reproduzir.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View arg0) {

                String data = TextoDigitado.getText().toString();
                Log.i("TTS", "Clicou no Botao: " + data);
                int speechStatus = textToSpeech.speak(data, TextToSpeech.QUEUE_FLUSH, null);

                if (speechStatus == TextToSpeech.ERROR) {
                    Log.e("TTS", "Erro ao Converter Texto em Fala!");
                }
            }

        });
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        if (textToSpeech != null) {
            textToSpeech.stop();
            textToSpeech.shutdown();
        }
    }
}