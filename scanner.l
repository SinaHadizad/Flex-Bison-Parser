/* Sina Hadizad
   srh160630@utdallas.edu
   CS3377.002
*/   

%option noyywrap
%option nounput
%option noinput

%{
  #include <stdlib.h>
  #include "y.tab.h"
%}

%%

[ \t\r]+                      { /* eat up whitespace */ }
"Sr."                         { return SR; }
"Jr."                         { return JR; }
"\n"                          { return EOL; }
"#"                           { return HASH; }
","                           { return COMMA; }
"-"                           { return DASH; }
[0-9]+                        { yylval.value = atoi (yytext); return INT; }
[IVX]+                        { yylval.str = strdup(yytext); return ROMAN; }
[A-Za-z][\.]?                 { yylval.str = strdup(yytext); return NAME_INITIAL; }
[A-Za-z]{2,}                  { yylval.str = strdup(yytext); return NAME; }
[A-Za-z0-9]+                  { yylval.str = strdup(yytext); return IDENTIFIER; }

%%
