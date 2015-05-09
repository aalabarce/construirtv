'use strict';

/* App Module */

//angular.module('bloodWindow', ['ui.router', 'bloodWindowAnimations', 'bloodWindowControllers', 'bloodWindowServices' ])

angular.module('construirTV', ['ngRoute', 'ui.bootstrap', 'construirTVControllers' ])

    .config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
      $routeProvider.
        when('/', {
          templateUrl: 'templates/content.home.html',
          controller: 'HomeCtrl'
        }).
        when('/titles', {
          templateUrl: 'templates/content.titulos.html',
          controller: 'TitulosCtrl',
          resolve: {
            validateToken: ['$http','$rootScope', function($http, $rootScope) {
              $rootScope.validateToken();
            }]
          }
        }).
        when('/titles/:tituloId', {
          templateUrl: 'templates/content.titulos.detail.html',
          controller: 'TitulosDetailCtrl',
          resolve: {
            validateToken: ['$http','$rootScope', function($http, $rootScope) {
              $rootScope.validateToken();
            }]
          }
        }).
        when('/register', {
          templateUrl: 'templates/content.registro.html',
          controller: 'RegistroCtrl'
        }).
        otherwise({
          redirectTo: '/'
        });

        /*
        // ELIMINATE "#" FROM URL. Check browser support
        if(window.history && window.history.pushState){
            //$locationProvider.html5Mode(true); will cause an error $location in HTML5 mode requires a  tag to be present! Unless you set baseUrl tag after head tag like so: <head> <base href="/">

         // to know more about setting base URL visit: https://docs.angularjs.org/error/$location/nobase

         // if you don't wish to set base URL then use this
         $locationProvider.html5Mode({
                 enabled: true,
                 requireBase: false
          });
        }
        */
    }])

    .run(['$rootScope', '$location', function($rootScope, $location) {
      
      // Declare global variables to acces to API
      $rootScope.client_id = "2_3yhgp61uxcys4gs0sw4oos008c0wkwokkw4g0k0044sk8kso0k";
      $rootScope.client_secret = "1frw8e9jdcw08kcg844k8s8cksowk48gogo848soo4kkowc88k";

      // Declare user name
      $rootScope.userName = window.localStorage['user_name'];

      //if($location.path())
      if($location.host() == "bloodwindow.tv") { // For production
        $rootScope.serverURL = "/web"; // URL for real app
        $rootScope.imagesSrc = "/uploads";
      } else { // For development
        $rootScope.serverURL = "/web/app_dev.php"; // URL for working local
        $rootScope.imagesSrc = "/web-app-martin/uploads/";
      }
    }]);
