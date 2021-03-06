'use strict'

###*
 # @ngdoc function
 # @name racingApp.controller:ImportsplashCtrl
 # @description
 # # ImportsplashCtrl
 # Controller of the racingApp
###
angular.module('racingApp').controller 'ImportsplashCtrl', ($scope, isKongregate, game) ->
  # header/loadsave do the actual import
  $scope.isKongregate = isKongregate()

  $scope.click = (cb) ->
    game.withSave ->
    if $scope.isKongregate
      window.location.href = 'http://www.kongregate.com/games/groupsky/rcm'
    else
      window.location.hash = '/'
    cb?()
