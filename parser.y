/* Sina Hadizad
   srh160630@utdallas.edu
   CS3377.002
*/   

%{
  #include <stdio.h>
  int yylex(void);
  void yyerror(char *);
%}

%union
{
  int value;
  char *str;
}

%type <str>    COMMA
%type <str>    HASH
%type <str>    DASH
%type <str>    EOL
%type <value>  INT
%type <str>    NAME
%type <str>    IDENTIFIER
%type <str>    NAME_INITIAL
%type <str>    SR
%type <str>    JR
%type <str>    ROMAN

%token COMMA
%token HASH
%token DASH
%token EOL
%token INT
%token NAME
%token IDENTIFIER
%token NAME_INITIAL
%token SR
%token JR
%token ROMAN

%start postal_addresses

%%

postal_addresses : address_block EOL postal_addresses
               	 | address_block		 
               	 ;

address_block : name_part street_address location_part
              ;

name_part : personal_part last_name suffix_part EOL 
	  | personal_part last_name EOL 
	  | error EOL {printf("\nBad name_part ... skipping to newline");} 
          ;

personal_part : NAME {fprintf(stderr, "<FirstName>%s</FirstName>\n", $1);}
              | NAME_INITIAL {fprintf(stderr, "<FirstName>%s</FirstName>\n", $1);}
              ;

last_name : NAME {fprintf(stderr, "<LastName>%s</LastName>\n", $1);} 
          ;

suffix_part : SR
            | JR {fprintf(stderr, "<Suffix>%s</Suffix>\n", $1);}
	    | ROMAN {fprintf(stderr, "<Suffix>%s</Suffix>\n", $1);}
            ; 

street_address : street_number street_name INT EOL {fprintf(stderr, "<AptNum>%d</AptNum>\n", $3);}
               | street_number street_name HASH INT EOL {fprintf(stderr, "<AptNum>%d</AptNum>\n", $4);}
	       | street_number street_name EOL
      	       | error EOL {printf("\nBad adress_line ... skipping to newline");} 
               ;

street_number : INT {fprintf(stderr, "<HouseNumber>%d</HouseNumber>\n", $1);}
              | IDENTIFIER {fprintf(stderr, "<HouseNumber>%s</HouseNumber>\n", $1);}
              ;

street_name : NAME {fprintf(stderr, "<StreetName>%s</StreetName>\n", $1);}
            ;

location_part : town_name COMMA state_code zip_code EOL
              | error EOL {printf("\nBad location_line ... skipping to newline\n");}
              ; 

town_name : NAME {fprintf(stderr, "<City>%s</City>\n", $1);}
          ;

state_code : NAME {fprintf(stderr, "<State>%s</State>\n", $1);}
           ;

zip_code : INT DASH INT {fprintf(stderr, "<Zip5>%d</Zip5>\n<Zip4>%d</Zip4>\n\n", $1, $3);}
         | INT {fprintf(stderr, "<Zip5>%d</Zip5>\n\n", $1);}
         ;

%%

void yyerror(char *s)
{
}
