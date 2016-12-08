# ElasticSearch Query Parser

	Library for convert text expression to Query DSL format


## Usage

###### code

```js
const parser = require('./index');
console.log(parser('apple'));
console.log(parser('fruit: apple'));
console.log(parser('cherry AND NOT avocado'));
console.log(parser('olive OR (peach AND NOT "sugar-apple")'));
console.log(parser('NOT "Name field": mango'));
```

###### result
```js
{"query":{"match_all":{}},"filter":{"fquery":{"query":{"match":{"_all":{"query":"apple"}}}}}}
{"query":{"match_all":{}},"filter":{"fquery":{"query":{"match":{"fruit":{"query":"apple"}}}}}}
{"query":{"match_all":{}},"filter":{"and":{"filters":[{"fquery":{"query":{"match":{"_all":{"query":"cherry"}}}}},{"not":{"fquery":{"query":{"match":{"_all":{"query":"avocado"}}}}}}]}}}
{"query":{"match_all":{}},"filter":{"or":{"filters":[{"fquery":{"query":{"match":{"_all":{"query":"olive"}}}}},{"and":{"filters":[{"fquery":{"query":{"match":{"_all":{"query":"peach"}}}}},{"not":{"fquery":{"query":{"match":{"_all":{"query":"sugar-apple"}}}}}}]}}]}}}
{"query":{"match_all":{}},"filter":{"not":{"fquery":{"query":{"match":{"Name field":{"query":"mango"}}}}}}}
```

## License
MIT Copyright (c) 2016 Yaroslav Gaponov <yaroslav.gaponov@gmail.com>