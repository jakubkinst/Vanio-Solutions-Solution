angular.module('frontendApp').service 'OfferStore', ($http) ->
	API_ROOT = 'http://localhost:3000'
	list: (success, error) ->
		$http.get("#{API_ROOT}/offers").then (response)->
			success(response.data)
		, error

	add: (offer, success, error) ->
		data = offer
		$http.post("#{API_ROOT}/offers", data).then success, error