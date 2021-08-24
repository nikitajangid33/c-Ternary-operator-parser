%{ 
  #include "y.tab.h"

  /*
  lex file that provides token to the parser.
  PROCESS:  This lex file will extract all the tokens and everthing else is sent as well,
            but they don't contribute to the language and will be rejected.
            The yacc file will parse the tokens as per the grammar rules with only one  
            semmantic action that prints vaild if the parser is able to generate the parser tree
            for the given input just to check the validity only .

  */

%}

%%
[0-9]+    return NUM;
"<="      return LE;
">="      return GE;
"=="      return EQ;
"!="      return NE;
"||"      return OR;
"&&"      return AND;
"!"       return NOT;
"true"    return T;
"false"   return F;
[a-zA-Z_][a-zA-Z0-9_]*    { return ID; }
.         return *yytext;
\n        return NEWLINE;
%%

int yywrap()
{
  return 1;
}