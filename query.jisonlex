
id		[a-zA-Z0-9*?]+
string		\"[^\"]*\"|\'[^\']*\'

%%

"("		return 'LPAREN';
")"		return 'RPAREN';

"NOT"		return 'NOT';
"OR"		return 'OR';
"AND"		return 'AND';

{id}":"         yytext = yytext.substr(0,yyleng-1); return 'NAME';
{string}":"     yytext = yytext.substr(1,yyleng-3); return 'NAME';

{string}	yytext = yytext.substr(1,yyleng-2); return 'TERM';
{id}		return 'TERM';

\s+		/*skip whitespace*/
"."		throw 'Illegal character';
<<EOF>>		return 'EOF';
