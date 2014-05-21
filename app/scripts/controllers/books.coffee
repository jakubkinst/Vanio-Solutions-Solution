'use strict'

angular.module('frontendApp')
.controller 'BooksCtrl', ($scope, BookStore) ->
	$scope.books = []
	$scope.newBook =
		title: ''
		author: ''
		publisher: ''
		year: ''
	$scope.gridOptions =
		data: 'books'
		showGroupPanel: true,
		enablePinning: true,
		columnDefs: [
			{field:'title', displayName:'Title'},
			{field:'author', displayName:'Author'},
			{field:'publisher', displayName:'Publisher'},
			{field:'year', displayName:'Year'},
		]


	$scope.refreshBooks = ->
		BookStore.list (books) ->
			$scope.books = books

	$scope.refreshBooks()

	$scope.isNewBookValid = ->
		return $scope.newBook?.title?.trim() != '' && $scope.newBook?.author?.trim() != '' && $scope.newBook?.publisher?.trim() != '' && $scope.newBook?.year?.trim() != ''

	$scope.addBook = ->
		BookStore.add $scope.newBook, ->
			angular.element('#addBook').modal('hide')
			$scope.refreshBooks()
