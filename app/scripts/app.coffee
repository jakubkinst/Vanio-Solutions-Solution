'use strict'

angular.module('frontendApp', [
	'ngCookies',
	'ngResource',
	'ngSanitize',
	'ngRoute',
	'ngGrid'
])
.config(($routeProvider) ->
	$routeProvider
	.when('/', {templateUrl: 'views/offers.html', controller: 'OffersCtrl'})
	.when('/books',
		{templateUrl: 'views/books.html', controller: 'BooksCtrl'}).otherwise
		redirectTo: '/'
)

