const express = require('express');
const res = require('express/lib/response');

const app = express();

app.get('/', function (req, res){
    res.send("Hello World 2");
});

app.listen(80, () => console.log('server ready'))

TextDecoderStream

res
