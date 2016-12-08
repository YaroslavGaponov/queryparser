all: build test1 test1_1 test2 test2_1 test1 test3 test4

clean: query.js
	rm -rf query.js

build: query.jison
	jison query.jison query.jisonlex

test1: query.js
	node query.js tests/test1

test1_1: query.js
	node query.js tests/test1_1

test2: query.js
	node query.js tests/test2

test2_1: query.js
	node query.js tests/test2_1

test3: query.js
	node query.js tests/test3

test4: query.js
	node query.js tests/test4
