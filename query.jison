
%{
    const DEFAULT_FIELD_NAME = '_all';
    const ejs = require('elastic.js');
%}

%right 'NOT'
%left 'OR' 'AND'

%start query

%%

query
    : e EOF
	{
	    return ejs.Request().query(ejs.MatchAllQuery()).filter($1).toJSON(); 
	}
;

e
    : e OR e
	{
	    $$ = ejs.OrFilter([$1, $3]);
	}
    | e AND e
	{
	    $$ = ejs.AndFilter([$1, $3]);
	}
    | NOT e
	{
	    $$ = ejs.NotFilter($2);
	}
    | LPAREN e RPAREN
	{
	    $$ = $2;
	}
    | NAME TERM
	{
	    if ($1.indexOf('*') > -1 || $2.indexOf('?') > -1) {
		$$ = ejs.QueryFilter(ejs.WildcardQuery($1, $2));
	    } else {
		$$ = ejs.QueryFilter(ejs.MatchQuery($1, $2));
	    }
	}
    | TERM
	{
	    if ($1.indexOf('*') > -1 || $1.indexOf('?') > -1) {
		$$ = ejs.QueryFilter(ejs.WildcardQuery (DEFAULT_FIELD_NAME, $1));
	    } else {
		$$ = ejs.QueryFilter(ejs.MatchQuery(DEFAULT_FIELD_NAME, $1));
	    }
	}
    ;



