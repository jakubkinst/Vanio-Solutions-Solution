angular.module('frontendApp').service 'BookStore', ($http) ->
	API_ROOT = 'http://localhost:3000'
	books: [
		{author: 'John Doe', title: 'Some title', publisher: 'Grada', year: 2010},
		{author: 'Franz Joseph', title: 'Little prince', publisher: 'CPress', year: 2013},
		{author: 'Emily Watson', title: 'Love is all around us', publisher: 'Ewing', year: 1978},
		{author: 'Peter McCallister', title: 'Home Alone', publisher: 'Interpub', year: 1986}
	]
	list: (success, error) ->
		$http.get("#{API_ROOT}/books").then (response)->
			success(response.data)
		, error

	add: (book, success, error) ->
		data = book
		$http.post("#{API_ROOT}/books", data).then success, error