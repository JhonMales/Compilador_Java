package Compilador;
import static Compilador.Tokens.*;
%%
%class Lexico
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t \r]+
%{
    public String lexemas;
%}
%%
/* Tipo de dato String */
( String ) {lexemas=yytext(); return Cadena;}

/* Espacios en blanco */
{ espacio} {/*Ignore*/ }

/* Comentarios */
( "//"(.)* ) {/*Ignore*/ }

/* Salto de linea */
( "\n" ) {return Linea;}

/* Comillas */
( "\"" ) {lexemas=yytext(); return Comillas;}

/* Separador de argumentos */
( "," ) {lexemas=yytext(); return Separador;}

/* Tipos de datos */
( byte | int | char | long | float | double ) {lexemas=yytext(); return T_dato; }

/* Declaracion de variable */
( "%" ) {lexemas=yytext(); return Declara;}

/* Operador Igual */
( "=" ) {lexemas=yytext(); return Igual;}

/* Operador Suma */
( "+" ) {lexemas=yytext(); return Suma;}

/* Operador Resta */
( "-" ) {lexemas=yytext(); return Resta;}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {lexemas=yytext(); return Op_logico; }

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexemas = yytext(); return Op_relacional;}

/* Operadores Atribucion */
( "+=" | "-=" | "*=" | "/=" | "%=" ) {lexemas = yytext(); return Op_atribucion; }

/* Operadores Incremento y decremento */
( "++" | "--" ) {lexemas = yytext(); return Op_incremento; }

/*Operadores Booleanos*/
( true | false) {lexemas = yytext(); return Op_booleano; }

/* Parentesis de apertura */
( "(" ) {lexemas=yytext(); return Parent_a;}

/* Parentesis de cierre */
( ")" ) {lexemas=yytext(); return Parent_c;}

/* Llave de apertura */
( "{" ) {lexemas=yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexemas=yytext(); return Llave_c;}

/* Corchete de apertura */
( "[" ) {lexemas=yytext(); return Corchete_a;}

/* Corchete de cierre */
( "]" ) {lexemas=yytext(); return Corchete_c;}



/* P_coma */
( ";" ) {lexemas=yytext(); return P_coma;}

/* Directiva de preprocesador */
( "#" ) {lexemas=yytext(); return Directiva;}

/*Operador de resolución de alcance */
( "::" ) {lexemas=yytext(); return Op_alcance;}

/* Palabra reservada Include */ 
( include ) {lexemas=yytext(); return Include; }

/* Palabra reservada Define */
( "define" ) {lexemas=yytext(); return Define;}

/* Palabra reservada Break */ ( break ) 
{lexemas=yytext(); return Break ; }

/* Palabra reservada Case */
( case ) {lexemas=yytext(); return Case; }

/* Palabra reservada Const */
( "const" ) {lexemas=yytext(); return Const;}

/* Palabra reservada Continue */
( "continue" ) {lexemas=yytext(); return Continue;}

/* Palabra reservada Default */ 
( default ) {lexemas=yytext(); return Default; }

/* Palabra reservada Do */
( do ) {lexemas=yytext(); return Do; }

/* Palabra reservada For */ 
( for ) {lexemas=yytext(); return For; }

/* Palabra reservada If */
( if ) {lexemas=yytext(); return If; }

/* Palabra reservada Else */
( else ) {lexemas=yytext(); return Else; }

/* Palabra reservada Register */
( "register" ) {lexemas=yytext(); return Register;}

/* Palabra reservada Return */
( "return" ) {lexemas=yytext(); return Return;}

/* Palabra reservada Short */
( "short" ) {lexemas=yytext(); return Short;}

/* Palabra reservada Unsigned */
( "unsigned" ) {lexemas=yytext(); return Unsigned;}

/* Palabra reservada Struct */
( "struct" ) {lexemas=yytext(); return Struct;}

/* Palabra reservada Switch */
( "switch" ) {lexemas=yytext(); return Switch;}

/* Palabra reservada Typedef */
( "typedef" ) {lexemas=yytext(); return Typedef;}

/* Palabra reservada Void */
( "void" ) {lexemas=yytext(); return Void;}

/* Palabra reservada While */
( "while" ) {lexemas=yytext(); return While;}

/* Palabra reservada Enum */
( "enum" ) {lexemas=yytext(); return Enum;}

/* Palabra reservada Extern */
( "extern" ) {lexemas=yytext(); return Extern;}

/* Palabra reservada Goto reservada */
( "goto" ) {lexemas=yytext(); return Goto;}

/* Palabra reservada Signed */
( "signed" ) {lexemas=yytext(); return Signed;}

/* Palabra reservada Sizeof */
( "sizeof" ) {lexemas=yytext(); return Sizeof;}

/* Palabra reservada Static */
( "static" ) {lexemas=yytext(); return Static;}

/* Palabra reservada Union */
( "union" ) {lexemas=yytext(); return Union;}

/* Palabra reservada Volatile */
( "volatile" ) {lexemas=yytext(); return Volatile;}

/* Funcion Printf */
( "printf" ) {lexemas=yytext(); return Printf;}

/* Funcion Scanf */
( "scanf" ) {lexemas=yytext(); return Scanf;}

/* Funcion Cin */
( "cin" ) {lexemas=yytext(); return Cin;}

/* Funcion Cout */
( "cout" ) {lexemas=yytext(); return Cout;}

/* Funcion Using */
( "using" ) {lexemas=yytext(); return Using;}

/* Funcion Namespace */
( "namespace" ) {lexemas=yytext(); return Namespace;}

/* Palabra reservada Std*/ 
( std ) {lexemas=yytext(); return Std; }

/* Marcador de inicio de algoritmo */
( "main" ) {lexemas=yytext(); return Main;}

/* Identificador */
{L}({L}|{D})* {lexemas=yytext(); return Identificador;}

/* Numero */
( "(-"{D}+")")|{D}+ {lexemas=yytext(); return Numero; }

/* Error de analisis */
 . {return ERROR;}
