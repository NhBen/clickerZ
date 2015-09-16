'use strict'

###*
 # @ngdoc service
 # @name racingApp.dialogService
 # @description
 # # dialogService
 #
###
angular.module('racingApp').service 'dialogService', ($rootScope, $log, $modal, $controller) -> new class DialogService
  constructor: ->
    @dialogs =
      options:
        template: 'views/options.html'
        controller: 'OptionsCtrl'
      achievements:
        template: 'views/achievementsdialog.html'
        controller: 'AchievementsCtrl'
      statistics:
        template: 'views/statistics.html'
        controller: 'StatisticsCtrl'
      feedback:
        template: 'views/contact.html'
        controller: 'ContactCtrl'
      changelog:
        template: 'views/changelog.html'
  openDialog: (name) ->
    controllerScope = $rootScope.$new()
    controllerScope.closeDialog = () ->
      controllerScope.modalInstance.dismiss()
    if(@dialogs[name].controller)
      $controller(@dialogs[name].controller, {$scope: controllerScope})
    controllerScope.modalInstance = $modal.open({
      templateUrl: @dialogs[name].template
      scope: controllerScope
      size: 'lg'
      })
