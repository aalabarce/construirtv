'use strict';

/* Controllers */

angular.module('construirTVControllers', [])

.controller('HeaderCtrl', ['$scope', '$http', '$rootScope', '$modal', '$location', '$routeParams', function($scope, $http, $rootScope, $modal, $location, $routeParams) {
  
  // Set the value to variable for updating class active in header menu
  $rootScope.currentUrl = $location.path();
  $scope.isCollapsed = true; // Bootstrap header setting
   
  $rootScope.searchInputText = ""; // Set var to emty string, because if not is 'undefined'
  $scope.change = function () {
    if (angular.isUndefined($scope.searchInput) || $scope.searchInput == null) {
      $rootScope.searchInputText = "";
    }
    else {
      $rootScope.searchInputText = $scope.searchInput;
    }
  }

  // ***** START OPEN MODAL LOGIN *****
  $scope.openLogin = function () {

    var modalInstance = $modal.open({
      templateUrl: 'templates/modals/modal.login.html',
      controller: 'LoginCtrl',
      size: 'lg',
      backdrop: 'static',
      keyboard: false
    });

  };
  // ***** END OPEN MODAL LOGIN *****

  // ***** LOOK IN LOCAL STORAGE FOR VALID TOKEN *****
  $rootScope.validateToken = function() {
    // Look in local storage for token
    if(window.localStorage['access_token']) {
      // ***** START API ***** Validate token
      $http({
        method: 'GET',
        //url: $rootScope.serverURL + "/oauth/v2/token?client_id=" + $rootScope.client_id + "&client_secret=" + $rootScope.client_secret + "&grant_type=password&username=" + ajam28d + "&password=" + 123;
        url: $rootScope.serverURL + "/api/articles?access_token=" + window.localStorage['access_token']
        })
        .success(function(data, status){
            $rootScope.userName = data; // CHECK THIS
            console.log(data, status);  //remove for production
        })
        .error(function(data, status){
            $scope.openLogin();
            console.log(data, status); //remove for production
      });
      // ***** END API *****
    } else { // If there is no token in logal storage open login
      $scope.openLogin();
    }
  }
  // ***** END LOOK IN LOCAL STORAGE FOR VALID TOKEN *****

  // ***** LOGOUT USER *****
  $scope.userLogout = function() {
    window.localStorage['access_token'] = "";
  }
  // ***** END LOGOUT USER *****


}])

.controller('languageCtrl', ['$scope', '$http', '$rootScope', function($scope, $http, $rootScope) {
  
  $rootScope.language = "eng"; // Set default language to Spanish

  // ***** SET LENGUAGUE *****
  $scope.setLanguage = function(thisLanguage) {
    $rootScope.language = thisLanguage;
    $http({
    method: 'GET',
    url: "languages/" + thisLanguage + ".json"
    })
    .success(function(data, status){
        $rootScope.languageHeader = data.header; // All tags used in SidebarCtrl
        $rootScope.languageLogIn = data.login; // All tags used in LoginCtrl
        $rootScope.languageHome = data.home; // All tags used in HomeCtrl
        $rootScope.languageTituloDetail = data.tituloDetail; // All tags used in TituloDetailCtrl
        $rootScope.languageRegister = data.register; // All tags used in RegistroCtrl

        console.log(data, status);  //remove for production
    })
    .error(function(data, status){
        console.log(data, status); //remove for production
    });
  }
  // ***** END SET LENGUAGUE *****

  $scope.setLanguage("esp"); // Set default language to Spanish
  
}])

.controller('LoginCtrl', ['$scope', '$routeParams', '$http', '$rootScope', '$modalInstance', '$location', '$sce', function($scope, $routeParams, $http, $rootScope, $modalInstance, $location, $sce) {
    
  // ***** START API ***** Get corto detail
  $scope.showPreloader = true; // Show preloader gif
  $scope.cortoResult = true; // Set to true for showing label titles in pop up

  // ***** START MODAL CLOSE FUNCTIONS *****
  $scope.ok = function () {
    $location.path("/").replace(); // If user quits login, redirect to home
    $modalInstance.close(); // Close modal after redirecting
  };

  $scope.cancel = function () {
    $modalInstance.dismiss('cancel');
  };
  // ***** END MODAL CLOSE FUNCTIONS *****


  // ***** LOGIN USER *****
  $scope.userLogin = function(email, password) {
      // ***** START API ***** Get token
      $http({
        method: 'GET',
        url: $rootScope.serverURL + "/oauth/v2/token?client_id=" + $rootScope.client_id + "&client_secret=" + $rootScope.client_secret + "&grant_type=password&username=" + email + "&password=" + password
        })
        .success(function(data, status){
            $rootScope.userName = data.user_name; // CHECK THIS
            // Save token in local storage
            window.localStorage['access_token'] = data.access_token; //CHECK THIS
            //window.localStorage['access_token'] = "YzZiYjhmNmIxYTcyMTY5MTU3MGQyYTJkZGNkMzM4N2JkZWZhNTBjYWYxNjA2MDM1NWNkMDcxMjYyM2VlYTNjNw";
            console.log(data, status);  //remove for production
        })
        .error(function(data, status){
            $scope.showErrors = data; //CHECK THIS
            alert(data);
            console.log(data, status); //remove for production
      });
      // ***** END API *****
  }
  // ***** END LOGIN USER *****

}])

// **************************************** HASTA ACA LLEGUE ****************************************
// TODO:
// * Guardar Usuario en local storage cuando se loguea o conecta
// * 

.controller('HomeCtrl', ['$scope', '$http', '$rootScope', '$modal', '$location', '$routeParams', function($scope, $http, $rootScope, $modal, $location, $routeParams) {
  // Set the value to variable for updating class active in header menu
  // In this case harcode the URL for showing active HOME in menu, besides the cortoID (if any)
  $rootScope.currentUrl = "/";
  window.scrollTo(0,0);

  // ***** START API ***** Get Destacados titles */*/*/*/*/NOT FINISHED/*/*/*/*/*/
  $scope.slides = "";
  $scope.getDestacados = function() {
    $http({
    method: 'GET',
    url: $rootScope.serverURL + "/api/titulos/destacados"
    })
    .success(function(data, status){
        $scope.slides = data;
        console.log(data, status);  //remove for production
    })
    .error(function(data, status){
        console.log(data, status); //remove for production
    });
  }
  // ***** END API *****

  // ***** START API ***** Get All titles with filters */*/*/*/*/NOT FINISHED/*/*/*/*/*/
  $scope.filterTitles = true; // Set var to true for not showing error message
  $scope.getFilterTitles = function() {
    $scope.showPreloader = true; // Show preloader gif
    $scope.searchGenero = ""; // Edit stored parameters
    $scope.sendToAPI = '{"inputBuscador": "' + $scope.searchBuscador + '", "genero": "' + $scope.searchGenero + '", "festival": "' + $scope.searchFestival + '"}'; // inputBuscador take the value of 'titulo', 'anio' and 'director'
    $http({
        method: 'POST',
        url: $rootScope.serverURL + "/buscar/corto",
        data: $scope.sendToAPI
    })
    .success(function(data, status){
        $scope.filterTitles = data;
        $scope.showPreloader = false; // Hide preloader gif
        console.log(data, status);  //remove for production
    })
    .error(function(data, status){
        $scope.filterTitles = ""; // Set var to lenght cero for showing error message
        $scope.showPreloader = false; // Hide preloader gif
        console.log(data, status); //remove for production
    });
  }
  // ***** END API *****

  // ***** START API ***** Get all Genders for filter
  $scope.genders = "";
  $scope.getAllGenders = function() {
    $http({
        method: 'GET',
        url: $rootScope.serverURL + "/api/generos"
    })
    .success(function(data, status){
        $scope.genders = data;
        console.log(data, status);  //remove for production
    })
    .error(function(data, status){
        console.log(data, status); //remove for production
    });
  }
  // ***** END API *****

  // ***** START API ***** Get all titles from gender ///// If filterTitles empty show error in html, if not empty show results
  $scope.filterTitles = true; // Set var to true for not showing error message
  $scope.getTitlesFromGender = function(genderID) {
    $scope.showPreloader = true; // Show preloader gif
    $http({
        method: 'GET',
        url: $rootScope.serverURL + "/api/titulos?serie_id=" + genderID
    })
    .success(function(data, status){
        $scope.filterTitles = data;
        $scope.showPreloader = false; // Hide preloader gif
        console.log(data, status);  //remove for production
    })
    .error(function(data, status){
        $scope.filterTitles = ""; // Set var to lenght cero for showing error message
        $scope.showPreloader = false; // Hide preloader gif
        console.log(data, status); //remove for production
    });
  }
  // ***** END API *****

  // ***** START CAROUSEL *****
  $scope.getDestacados();
  $scope.myInterval = 5000;

  // ***** END CAROUSEL *****

  // ***** START INPUT SEARCH RESULT *****
  // Get value from input search and get data from API
  $scope.showCarousel = true;
  $scope.$watch('searchInputText', function() {
    window.scrollTo(0,0);
    if($rootScope.searchInputText) $scope.showCarousel = false;
    else $scope.showCarousel = true;
    //$scope.searchFestival = ""; uncoment for reseting festivals to all
    $scope.searchBuscador = $rootScope.searchInputText;
    $scope.getFilterTitles(); // This function will be call when controller is called and when $rootScope.searchInputText changes.

  });
  // ***** END INPUT SEARCH RESULT *****

  // ***** START RESULT GENDER TABS *****
  $scope.searchGender = "";
  $scope.searchBuscador = "";
  $scope.getAllGenders();
  $scope.setCurrentGender = function(value) {
    $scope.searchGender = value;
    $scope.getTitlesFromGender(value);
  }
  // ***** END RESULT TABS *****

}])

.controller('CortoDetailCtrl', ['$scope', '$routeParams', '$http', '$rootScope', '$modalInstance', '$location', 'cortoId', '$sce', function($scope, $routeParams, $http, $rootScope, $modalInstance, $location, cortoId, $sce) {

  $scope.id = cortoId; // cortoId value is set in the function 'openCortoDetail' located in 'HomeCtrl'
  
  //$location.path("/home/" + $scope.id).replace(); // Change URL to HOME for deleting crotId parameter (if exists) 
  
  // ***** START API ***** Get corto detail
  $scope.showPreloader = true; // Show preloader gif
  $scope.cortoResult = true; // Set to true for showing label titles in pop up
  $scope.sendToAPI = '{"id": "' + $scope.id + '" }';
  $http({
      method: 'POST',
      url: $rootScope.serverURL + "/corto",
      data: $scope.sendToAPI
  })
  .success(function(data, status){
      $scope.cortoResult = data[0];
      $scope.showPreloader = false; // Hide preloader gif
      console.log(data, status);  //remove for production
  })
  .error(function(data, status){
      $scope.cortoResult = false; // Set to false for showing error pop up
      $scope.showPreloader = false; // Hide preloader gif
      console.log(data, status); //remove for production
  });
  // ***** END API *****

  // ***** START MODAL CLOSE FUNCTIONS *****
  $scope.ok = function () {
    $modalInstance.close();
    $location.path("/home").replace(); // Change URL to HOME for deleting crotId parameter (if exists)
  };

  $scope.cancel = function () {
    $modalInstance.dismiss('cancel');
  };
  // ***** END MODAL CLOSE FUNCTIONS *****

  // ***** START VIMEP VALIDATION URL *****
  $scope.trustSrc = function(src) {
    return $sce.trustAsResourceUrl("//player.vimeo.com/video/" + src);
  }
  // ***** END VIMEP VALIDATION URL *****

}])

.controller('TitulosCtrl', ['$scope', '$http', '$rootScope', '$location', function($scope, $http, $rootScope, $location) {
  // Set the value to variable for updating class active in header menu
  $rootScope.currentUrl = $location.path();
  window.scrollTo(0,0);

  // ***** START API ***** Get All Proyectos with filters
  $scope.orderBy = "anio"; // Edit stored parameters
  $scope.orderBy = "financiacion"; // Edit stored parameters

  $scope.getAllProyectos = function() {
    $scope.sendToAPI = '{"orderBy": "' + $scope.orderBy + '"}';
    $http({
        method: 'POST',
        url: $rootScope.serverURL + "/industria/proyectos",
        data: $scope.sendToAPI
    })
    .success(function(data, status){

        console.log(data, status);  //remove for production
        
        // Split the results in arrays of 4 elements
        $scope.proyectos = [];
        while (data.length > 0)
        $scope.proyectos.push(data.splice(0, 4));
        
    })
    .error(function(data, status){
        console.log(data, status); //remove for production
    });
  }
  // ***** END API *****
  $scope.getAllProyectos();
}])

.controller('TitulosDetailCtrl', ['$scope', '$routeParams', '$http', '$rootScope', '$location', function($scope, $routeParams, $http, $rootScope, $location) {

  // Set the value to variable for updating class active in header menu
  // In this case harcode the URL for showing active PROYECTOS in menu
  $rootScope.currentUrl = "/proyectos";
  window.scrollTo(0,0);

  $scope.id = $routeParams.proyectoId;

  // ***** START API ***** Get proyecto detail
  $scope.showPreloader = true; // Show preloader gif
  $scope.proyectoResult = true; // Set to true for showing label titles
  $scope.sendToAPI = '{"id": "' + $scope.id + '" }';
  $http({
      method: 'POST',
      url: $rootScope.serverURL + "/industria/proyecto",
      data: $scope.sendToAPI
  })
  .success(function(data, status){
      $scope.proyectoResult = data[0];
      $scope.showPreloader = false; // Hide preloader gif
      console.log(data, status);  //remove for production

  })
  .error(function(data, status){
      $scope.proyectoResult = false; // Set to false for showing error pop up
      $scope.showPreloader = false; // Hide preloader gif
      console.log(data, status); //remove for production
  });
  // ***** END API *****

}])

.controller('RegistroCtrl', ['$scope', '$routeParams', '$http', '$rootScope', '$location', function($scope, $routeParams, $http, $rootScope, $location) {

  // Set the value to variable for updating class active in header menu
  // In this case harcode the URL for showing active PROYECTOS in menu
  $rootScope.currentUrl = "/proyectos";
  window.scrollTo(0,0);

  $scope.id = $routeParams.proyectoId;

  // ***** START API ***** Get proyecto detail
  $scope.showPreloader = true; // Show preloader gif
  $scope.proyectoResult = true; // Set to true for showing label titles
  $scope.sendToAPI = '{"id": "' + $scope.id + '" }';
  $http({
      method: 'POST',
      url: $rootScope.serverURL + "/industria/proyecto",
      data: $scope.sendToAPI
  })
  .success(function(data, status){
      $scope.proyectoResult = data[0];
      $scope.showPreloader = false; // Hide preloader gif
      console.log(data, status);  //remove for production

  })
  .error(function(data, status){
      $scope.proyectoResult = false; // Set to false for showing error pop up
      $scope.showPreloader = false; // Hide preloader gif
      console.log(data, status); //remove for production
  });
  // ***** END API *****

}])