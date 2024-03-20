package Compilador;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author jhonm
 */
public class AnalizadorLexico {
    public static void main(String[] args) throws Exception {
        
        String camino= "../SoloLexico_Basico/src/Compilador/Lexico.flex";
        String camino1= "../SoloLexico_Basico/src/Compilador/LexicoCup.flex";
        String[] caminoS= {"-parser","Sintaxis","../SoloLexico_Basico/src/Compilador/Sintaxis.cup"};
        generarLex(camino, camino1, caminoS);
    }
    public static void generarLex(String camino, String camino1, String[] caminoS) throws IOException, Exception {
        File arc; 
        arc = new File(camino);
        JFlex.Main.generate(arc);
        arc = new File(camino1);
        JFlex.Main.generate(arc);
        java_cup.Main.main(caminoS);     
        
        Path caminoSym = Paths.get("../SoloLexico_Basico/src/Compilador/sym.java");
        if (Files.exists(caminoSym)) {
            Files.delete(caminoSym);
        }
        Files.move(
                Paths.get("../SoloLexico_Basico/sym.java"), 
                Paths.get("../SoloLexico_Basico/src/Compilador/sym.java")
        );
        Path caminoSint = Paths.get("../SoloLexico_Basico/src/Compilador/Sintaxis.java");
        if (Files.exists(caminoSint)) {
            Files.delete(caminoSint);
        }
        Files.move(
                Paths.get("../SoloLexico_Basico/Sintaxis.java"), 
                Paths.get("../SoloLexico_Basico/src/Compilador/Sintaxis.java")
        );        
    }
}
