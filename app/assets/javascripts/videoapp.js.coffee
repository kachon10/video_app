videoApp = angular.module('videoApp', [
  'ui.bootstrap',
  'ngRoute',
  'videoControllers'
])

videoApp.config(['$routeProvider',
  ($routeProvider) ->
    $routeProvider.
      when('/', {
          templateUrl: '/templates/main.html',
          controller: 'MainCtrl'
        }).
      when('/new_user', {
          templateUrl: '/templates/new_user.html',
          controller: 'NewUserCtrl'
        }).
      when('/new_video', {
          templateUrl: '/templates/new_video.html',
          controller: 'NewVideoCtrl'
        }).
      when('/action_video', {
          templateUrl: '/templates/action_video.html',
          controller: 'ActionVideoCtrl'
        }).
      when('/new_ad', {
          templateUrl: '/templates/new_ad.html',
          controller: 'NewAdCtrl'
        }).
      when('/action_ad', {
          templateUrl: '/templates/action_ad.html',
          controller: 'ActionAdCtrl'
        })

])

videoControllers = angular.module('videoControllers', [])

angular.module('videoControllers').controller(
  'MainCtrl', ($scope, $http) ->
    console.log "MainCtrl constructor"
)

angular.module('videoControllers').controller(
  'NewUserCtrl', ($scope, $http) ->
    console.log "NewUserCtrl constructor"

    $scope.name = ""
    $scope.id = ""

    $scope.createUser = () ->
      console.log "createUser clicked #{$scope.name}"
      userData = {user: {name: $scope.name} } 
      $http.post('users', userData).
        success( (data) ->
          console.log "#{JSON.stringify data}"
          $scope.msg = JSON.stringify(data, null, 2)
        ).
        error( (data, status) ->
          console.log "Got error #{data} #{status}"
          $scope.msg = JSON.stringify(data, null, 2)
        )

    $scope.getUser = () ->
      console.log "get clicked #{$scope.id}"
      $http.get("users/#{$scope.id}").
        success( (data) ->
          $scope.msg = JSON.stringify(data, null, 2)
        ).
        error( (data, status) ->
          console.log "Got error #{data} #{status}"
          $scope.msg = JSON.stringify(data, null, 2)
        )
)

angular.module('videoControllers').controller(
  'NewVideoCtrl', ($scope, $http) ->
    console.log "NewVideoCtrl constructor"

    $scope.name = ""
    $scope.userId = ""
    $scope.id = ""

    $scope.createVideo = () ->
      console.log "createVideo clicked #{$scope.name}"
      pd = {video: {name: $scope.name, user: $scope.userId} } 
      $http.post('videos', pd).
        success( (data) ->
          console.log "#{JSON.stringify data}"
          $scope.msg = JSON.stringify(data, null, 2)
        ).
        error( (data, status) ->
          console.log "Got error #{data} #{status}"
          $scope.msg = JSON.stringify(data, null, 2)
        )

    $scope.getVideo = () ->
      console.log "get clicked #{$scope.id}"
      $http.get("videos/#{$scope.id}").
        success( (data) ->
          $scope.msg = JSON.stringify(data, null, 2)
        ).
        error( (data, status) ->
          console.log "Got error #{data} #{status}"
          $scope.msg = JSON.stringify(data, null, 2)
        )
)

angular.module('videoControllers').controller(
  'ActionVideoCtrl', ($scope, $http) ->
    console.log "ActionVideoCtrl constructor"

    $scope.videoId = ""
    $scope.userId = ""

    $scope.like = () ->
      console.log "like clicked #{$scope.videoId} #{$scope.userId}"
      pd = {user: $scope.userId} 
      $http.post("videos/#{$scope.videoId}/likes", pd).
        success( (data) ->
          console.log "#{JSON.stringify data}"
          $scope.msg = JSON.stringify(data, null, 2)
        ).
        error( (data, status) ->
          console.log "Got error #{data} #{status}"
          $scope.msg = JSON.stringify(data, null, 2)
        )

    $scope.dislike = () ->
      console.log "dislike clicked #{$scope.videoId} #{$scope.userId}"
      pd = {user: $scope.userId} 
      $http.post("videos/#{$scope.videoId}/dislikes", pd).
        success( (data) ->
          console.log "#{JSON.stringify data}"
          $scope.msg = JSON.stringify(data, null, 2)
        ).
        error( (data, status) ->
          console.log "Got error #{data} #{status}"
          $scope.msg = JSON.stringify(data, null, 2)
        )

    $scope.view = () ->
      console.log "view clicked #{$scope.videoId} #{$scope.userId}"
      pd = {user: $scope.userId} 
      $http.post("videos/#{$scope.videoId}/views", pd).
        success( (data) ->
          console.log "#{JSON.stringify data}"
          $scope.msg = JSON.stringify(data, null, 2)
        ).
        error( (data, status) ->
          console.log "Got error #{data} #{status}"
          $scope.msg = JSON.stringify(data, null, 2)
        )
)


angular.module('videoControllers').controller(
  'NewAdCtrl', ($scope, $http) ->
    console.log "NewAdCtrl constructor"

    $scope.name = ""
    $scope.id = ""

    $scope.createAd = () ->
      console.log "createAd clicked #{$scope.name}"
      pd = {ad: {name: $scope.name} } 
      $http.post('ads', pd).
        success( (data) ->
          console.log "#{JSON.stringify data}"
          $scope.msg = JSON.stringify(data, null, 2)
        ).
        error( (data, status) ->
          console.log "Got error #{data} #{status}"
          $scope.msg = JSON.stringify(data, null, 2)
        )

    $scope.getAd = () ->
      console.log "get clicked #{$scope.id}"
      $http.get("ads/#{$scope.id}").
        success( (data) ->
          $scope.msg = JSON.stringify(data, null, 2)
        ).
        error( (data, status) ->
          console.log "Got error #{data} #{status}"
          $scope.msg = JSON.stringify(data, null, 2)
        )
)

angular.module('videoControllers').controller(
  'ActionAdCtrl', ($scope, $http) ->
    console.log "ActionAdCtrl constructor"

    $scope.adId = ""
    $scope.videoId = ""

    $scope.click = () ->
      console.log "click clicked #{$scope.adId} #{$scope.videoId}"
      pd = {video: $scope.videoId} 
      $http.post("ads/#{$scope.adId}/clicks", pd).
        success( (data) ->
          console.log "#{JSON.stringify data}"
          $scope.msg = JSON.stringify(data, null, 2)
        ).
        error( (data, status) ->
          console.log "Got error #{data} #{status}"
          $scope.msg = JSON.stringify(data, null, 2)
        )

)