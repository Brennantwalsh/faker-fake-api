(function() {
  "use strict";
  angular.module("app").controller("starsController", function($scope, $http) {

    $scope.setup = function() {
      $http.get("api/v1/star_wars.json").then(function(response) {
        $scope.stars = response.data
      })
    }; 

    $scope.addPerson = function(addCharacter, addPlanet, addQuote) {
      let person = {
        character: addCharacter,
        planet: addPlanet,
        quote: addQuote
      };

      $http.post("api/v1/star_wars.json", person).then(function(response) {
      $scope.stars.push(response.data);
      $scope.addCharacter = null
      $scope.addPlanet = null
      $scope.addQuote = null
      $scope.errors = null

      }, function(error) {
        $scope.errors = error.data.errors;

      });
    };

    $scope.editPerson = function(id, editCharacter,  editPlanet, editQuote) {
      let person = {
        character: editCharacter,
        planet: editPlanet,
        quote: editQuote
      };
      let url = "api/v1/star_wars/" + id + ".json"

      $http.patch(url, person).then(function(response) {
        $scope.star = response.data;

      });

    };

    $scope.toggleOrder = function(attribute) {
      $scope.character = null;
      $scope.planet = null;
      $scope.quote = null;
      if(attribute != $scope.orderAttribute) {
        $scope.descending = false;
      }else {
        $scope.descending = !$scope.descending 
      }
      $scope.orderAttribute = attribute;
      if($scope.descending == false){
        $scope[attribute] = '^';
      }else {
        $scope[attribute] = 'v';
      }

    };


  });
}());