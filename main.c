//Sina Hadizad
//srh160630@utdallas.edu
//CS3377.002

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "y.tab.h"

int yyparse(void);
int yylex(void);
extern char *yytext;

int main(int argc, char *argv[])
{
  char str1[] = "./scanner"; //string of characters to compare value of argv[0]
  char str2[] = "./parser"; //string of characters to compare value of argv[0]

  if(strcmp(str1, argv[0]) == 0) // if statement that executes Scanner Mode 
  {
     printf("Operating in scan mode\n");

     int token = yylex();

     while(token != 0)
     {
        switch(token)
	   {
           case COMMA:
	     printf("yylex returned COMMA token (%d)\n", token);
             break;
           case DASH:
             printf("yylex returned DASH token (%d)\n", token);
             break;
           case HASH:
             printf("yylex returned HASH token (%d)\n", token);
             break;
           case EOL:
             printf("yylex returned EOL token (%d)\n", token);
             break;
           case INT:
             printf("yylex returned INT token (%s)\n", yytext);
             break;
           case NAME:
             printf("yylex returned NAME token(%s)\n", yytext);
             break;
           case IDENTIFIER:
             printf("yylex returned IDENTIFIER token(%s)\n", yytext);
             break;
           case NAME_INITIAL:
             printf("yylex returned NAME_INITIAL token (%s)\n", yytext);
             break;
           case SR:
             printf("yylex returned SR token (%s)\n", yytext);
             break;
           case JR:
             printf("yylex returned JR token (%s)\n", yytext);
             break;
	   case ROMAN:
	     printf("yylex returned ROMAN token (%d)\n", token);
	     break;
           default:
	     printf("UNKNOWN\n");
	     break;
          }
         
	  token = yylex();
      }
  }
  else if(strcmp(str2, argv[0]) == 0) // else if statement that executes Parser Mode
  {
     printf("Operating in parse mode\n");

     switch(yyparse())
        {
	case 0:
	   printf("\nParse Successful!\n");
	   break;
	case 1:
	   printf("Parse Failed!\n");
	   break;
	case 2:
	   printf("Out of Memory\n");
           break;
	default:
	   printf("Unknown result from yyparse()\n");
	   break;
	}   	   
  }

  return 0;
}     
