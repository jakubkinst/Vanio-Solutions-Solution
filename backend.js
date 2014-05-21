var express = require('express');
var bodyParser = require('body-parser');
var mongoose = require('mongoose');


var Schema = mongoose.Schema;

mongoose.connect('mongodb://localhost/books');

var app = express();
app.use(bodyParser());

// CORS enable
app.all('/*', function (req, res, next) {
	res.header("Access-Control-Allow-Origin", "*");
	res.header('Access-Control-Allow-Headers', 'Content-Type');
	next();
});

// BOOKS

var Book = mongoose.model('Book', {
	title: { type: String, required: true },
	author: { type: String, required: true },
	publisher: { type: String, required: true },
	year: { type: String, required: true }
});

app.get('/books', function (req, res) {
	return Book.find(function (err, books) {
		if (!err) {
			return res.send(books);
		} else {
			return console.log(err);
		}
	});
});

app.post('/books', function (req, res) {
	console.log("POST: ");
	console.log(req.body);
	var book = new Book({
		title: req.body.title,
		author: req.body.author,
		publisher: req.body.publisher,
		year: req.body.year
	});
	book.save(function (err) {
		if (!err) {
			return console.log("created");
		} else {
			return console.log(err);
		}
	});
	return res.send(book);
});


// OFFERS

var Offer = mongoose.model('Offer', {
	name: { type: String, required: true },
	email: { type: String, required: true },
	price: { type: Number, required: true },
	book: { type: Schema.Types.ObjectId, ref: 'Book' }
});

app.get('/offers', function (req, res) {
	return Offer.find().populate('book').exec(function (err, offers) {
		if (!err) {
			return res.send(offers);
		} else {
			return console.log(err);
		}
	});
});

app.post('/offers', function (req, res) {
	console.log("POST: ");
	console.log(req.body);
	var offer = new Offer({
		name: req.body.name,
		email: req.body.email,
		price: req.body.price,
		book: req.body.book
	});
	offer.save(function (err) {
		if (!err) {
			return console.log("created");
		} else {
			return console.log(err);
		}
	});
	return res.send(offer);
});


app.listen(3000);
console.log('Listening on port 3000...');