'use strict'

angular.module('frontendApp')
.controller 'OffersCtrl', ($scope, OfferStore, BookStore) ->
	$scope.offers = []
	$scope.newOffer =
		name:''
		email:''
		price:''
		book:''
	$scope.gridOptions =
		data: 'offers',
		showGroupPanel: true,
		enablePinning: true,
		columnDefs: [
			{field:'name', displayName:'User\'s name'},
			{field:'email', displayName:'E-Mail'},
			{field:'price', displayName:'Price'},
			{field:'book.title', displayName:'Book Title'},
			{field:'book.author', displayName:'Book Author'},
		]

	BookStore.list (books) ->
		$scope.books = books

	$scope.refreshOffers = ->
		OfferStore.list (offers) ->
			$scope.offers = offers

	$scope.refreshOffers()

	$scope.isNewOfferValid = ->
		return $scope.newOffer?.name?.trim() != '' && $scope.newOffer?.email?.trim() != '' && $scope.newOffer?.price?.trim() != '' && $scope.newOffer?.book?.trim() != ''

	$scope.addOffer = ->
		OfferStore.add $scope.newOffer, ->
			angular.element('#addOffer').modal('hide')
			$scope.refreshOffers()
