const parser = require('./index');
console.log(JSON.stringify(parser('apple')));
console.log(JSON.stringify(parser('fruit: apple')));
console.log(JSON.stringify(parser('cherry AND NOT avocado')));
console.log(JSON.stringify(parser('olive OR (peach AND NOT "sugar-apple")')));
console.log(JSON.stringify(parser('NOT "Name field": mango')));