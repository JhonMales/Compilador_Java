package Compilador;
import java_cup.runtime.Symbol;
%%
%class LexicoCup
%type java_cup.runtime.Symbol
%cup 
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t \r \n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Tipo de dato String */
( String ) {return new Symbol(sym.Cadena, yychar, yyline, yytext());}

/* Separador de argumentos */
( "," ) {return new Symbol(sym.Coma, yychar, yyline, yytext());}

/* Declaracion de variable */
( "%" ) {return new Symbol(sym.Declara, yychar, yyline, yytext());}

/* Espacios en blanco */
{ espacio} {/*Ignore*/ }

/* Comentarios */
( "//"(.)* ) {/*Ignore*/ }

/* Comillas */
( "\"" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());}

/* Tipos de datos */
( byte | long | float | double ) {return new Symbol(sym.T_dato, yychar, yyline, yytext());}

/* Tipo de dato Int */
( "int" ) {return new Symbol(sym.Int, yychar, yyline, yytext());}

/* Tipo de dato Char */
( "char" ) {return new Symbol(sym.Char, yychar, yyline, yytext());}

/* Operador Igual */
( "=" ) {return new Symbol(sym.Igual, yychar, yyline, yytext());}

/* Operador Suma */
( "+" ) {return new Symbol(sym.Suma, yychar, yyline, yytext());}

/* Operador Resta */
( "-" ) {return new Symbol(sym.Resta, yychar, yyline, yytext());}

/* Ampersand */
( "&" ) {return new Symbol(sym.Ampersand, yychar, yyline, yytext());}

/* Operadores logicos */
( "&&" | "||" | "!" | "|" ) {return new Symbol(sym.Op_logico, yychar, yyline, yytext());}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {return new Symbol(sym.Op_relacional, yychar, yyline, yytext());}

/* Operadores Atribucion */
( "+=" | "-=" | "*=" | "/=" | "%=" ) {return new Symbol(sym.Op_atribucion, yychar, yyline, yytext());}

/* Operadores Incremento y decremento */
( "++" | "--" ) {return new Symbol(sym.Op_incremento, yychar, yyline, yytext());}

/*Operadores Booleanos*/
( true | false) {return new Symbol(sym.Op_booleano, yychar, yyline, yytext());}

/* Parentesis de apertura */
( "(" ) {return new Symbol(sym.Parent_a, yychar, yyline, yytext());}

/* Parentesis de cierre */
( ")" ) {return new Symbol(sym.Parent_c, yychar, yyline, yytext());}

/* Llave de apertura */
( "{" ) {return new Symbol(sym.Llave_a, yychar, yyline, yytext());}

/* Llave de cierre */
( "}" ) {return new Symbol(sym.Llave_c, yychar, yyline, yytext());}

/* Corchete de apertura */
( "[" ) {return new Symbol(sym.Corchete_a, yychar, yyline, yytext());}

/* Corchete de cierre */
( "]" ) {return new Symbol(sym.Corchete_c, yychar, yyline, yytext());}

/* Marcador de inicio de algoritmo */
( "main" ) {return new Symbol(sym.Main, yychar, yyline, yytext());}

/* P_coma */
( ";" ) {return new Symbol(sym.P_coma, yychar, yyline, yytext());}

/* Directiva de preprocesador */
( "#" ) {return new Symbol(sym.Directiva, yychar, yyline, yytext());}

/* Operador de resolución de alcance */
( "::" ) {return new Symbol(sym.Op_alcance, yychar, yyline, yytext());}

/* Dos puntos */
( ":" ) {return new Symbol(sym.Dos_puntos, yychar, yyline, yytext());}

/* Palabra reservada Include */ 
( include ) {return new Symbol(sym.Include, yychar, yyline, yytext());}

/* Palabra reservada Define */
( "define" ) {return new Symbol(sym.Define, yychar, yyline, yytext());}

/* Palabra reservada Break */ 
( break ) {return new Symbol(sym.Break, yychar, yyline, yytext());}

/* Palabra reservada Case */
( case ) {return new Symbol(sym.Case, yychar, yyline, yytext());}

/* Palabra reservada Const */
( "const" ) {return new Symbol(sym.Const, yychar, yyline, yytext());}

/* Palabra reservada Continue */
( "continue" ) {return new Symbol(sym.Continue, yychar, yyline, yytext());}

/* Palabra reservada Default */ 
( default ) {return new Symbol(sym.Default, yychar, yyline, yytext());}

/* Palabra reservada Do */
( do ) {return new Symbol(sym.Do, yychar, yyline, yytext());}

/* Palabra reservada For */ 
( for ) {return new Symbol(sym.For, yychar, yyline, yytext());}

/* Palabra reservada If */
( if ) {return new Symbol(sym.If, yychar, yyline, yytext());}

/* Palabra reservada Else */
( else ) {return new Symbol(sym.Else, yychar, yyline, yytext());}

/* Palabra reservada Register */
( "register" ) {return new Symbol(sym.Register, yychar, yyline, yytext());}

/* Palabra reservada Return */
( "return" ) {return new Symbol(sym.Return, yychar, yyline, yytext());}

/* Palabra reservada Short */
( "short" ) {return new Symbol(sym.Short, yychar, yyline, yytext());}

/* Palabra reservada Unsigned */
( "unsigned" ) {return new Symbol(sym.Unsigned, yychar, yyline, yytext());}

/* Palabra reservada Struct */
( "struct" ) {return new Symbol(sym.Struct, yychar, yyline, yytext());}

/* Palabra reservada Switch */
( "switch" ) {return new Symbol(sym.Switch, yychar, yyline, yytext());}

/* Palabra reservada Typedef */
( "typedef" ) {return new Symbol(sym.Typedef, yychar, yyline, yytext());}

/* Palabra reservada Void */
( "void" ) {return new Symbol(sym.Void, yychar, yyline, yytext());}

/* Palabra reservada While */
( "while" ) {return new Symbol(sym.While, yychar, yyline, yytext());}

/* Palabra reservada Enum */
( "enum" ) {return new Symbol(sym.Enum, yychar, yyline, yytext());}

/* Palabra reservada Extern */
( "extern" ) {return new Symbol(sym.Extern, yychar, yyline, yytext());}

/* Palabra reservada Goto reservada */
( "goto" ) {return new Symbol(sym.Goto, yychar, yyline, yytext());}

/* Palabra reservada Signed */
( "signed" ) {return new Symbol(sym.Signed, yychar, yyline, yytext());}

/* Palabra reservada Sizeof */
( "sizeof" ) {return new Symbol(sym.Sizeof, yychar, yyline, yytext());}

/* Palabra reservada Static */
( "static" ) {return new Symbol(sym.Static, yychar, yyline, yytext());}

/* Palabra reservada Union */
( "union" ) {return new Symbol(sym.Union, yychar, yyline, yytext());}

/* Palabra reservada Volatile */
( "volatile" ) {return new Symbol(sym.Volatile, yychar, yyline, yytext());}

/* Funcion Printf */
( "printf" ) {return new Symbol(sym.Printf, yychar, yyline, yytext());}

/* Funcion Scanf */
( "scanf" ) {return new Symbol(sym.Scanf, yychar, yyline, yytext());}

/* Funcion Cin */
( "cin" ) {return new Symbol(sym.Cin, yychar, yyline, yytext());}

/* Funcion Cout */
( "cout" ) {return new Symbol(sym.Cout, yychar, yyline, yytext());}

/* Funcion Using */
( "using" ) {return new Symbol(sym.Using, yychar, yyline, yytext());}

/* Funcion Namespace */
( "namespace" ) {return new Symbol(sym.Namespace, yychar, yyline, yytext());}

/* Palabra reservada Std*/ 
( std ) {return new Symbol(sym.Std, yychar, yyline, yytext());}

/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}

/* Numero */
( "(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());}

/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}

