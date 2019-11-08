package br.com.testetypefont;

import android.content.Context;
import android.util.Log;
import android.widget.Toast;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * Criado por Lucas Pinheiro on 29/03/2019.
 */
public class ZipManager {


  /*  public static void unzip(String zipFile, String location) throws IOException {
        try {
            File file = new File(location);
            if (!file.isDirectory()) {
                file.mkdirs();
            }
            ZipInputStream zipimputstream = new ZipInputStream(new FileInputStream(zipFile));
            try {
                ZipEntry zipentry = null;
                while ((zipentry = zipimputstream.getNextEntry()) != null) {
                    String path = location + File.separator+ zipentry.getName();

                    if (zipentry.isDirectory()) {
                        File unzipFile = new File(path);
                        if (!unzipFile.isDirectory()) {
                            unzipFile.mkdirs();
                        }
                    } else {
                        FileOutputStream fout = new FileOutputStream(path, false);

                        try {
                            for (int c = zipimputstream.read(); c != -1; c = zipimputstream.read()) {
                                fout.write(c);
                            }
                            zipimputstream.closeEntry();
                        } finally {
                            fout.close();
                        }
                    }
                }
            } finally {
                zipimputstream.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            Log.e("ERROROOOOOOOOOO", "Unzip exception", e);
        }
    }*/


    public boolean unzip(String path, String zipname) {
        InputStream is;
        ZipInputStream zis;
        try {
            is = new FileInputStream(path+"/" + zipname);
            zis = new ZipInputStream(new BufferedInputStream(is));
            ZipEntry ze;

            while ((ze = zis.getNextEntry()) != null) {
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                byte[] buffer = new byte[1024];
                int count;

                String filename = ze.getName();
                FileOutputStream fout = new FileOutputStream(path+"/" + filename);

                // reading and writing
                while ((count = zis.read(buffer)) != -1) {
                    baos.write(buffer, 0, count);
                    byte[] bytes = baos.toByteArray();
                    fout.write(bytes);
                    baos.reset();
                }

                fout.close();
                zis.closeEntry();
            }

            zis.close();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }
}




