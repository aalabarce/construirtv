'use strict';

/* Controllers */

angular.module('construirTVControllers', [])

.controller('HeaderCtrl', ['$scope', '$http', '$rootScope', '$modal', '$location', '$routeParams', function($scope, $http, $rootScope, $modal, $location, $routeParams) {
  
  // Set the value to variable for updating class active in header menu
  $rootScope.currentUrl = $location.path();
  $scope.isCollapsed = true; // Bootstrap header setting
   
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
    $location.path("/").replace(); // If user logs out, redirect to home
    window.localStorage['access_token'] = "";
    window.localStorage['user_name'] = "";
    $rootScope.userName = window.localStorage['user_name'];
  }
  // ***** END LOGOUT USER *****

}])

.controller('SearchCtrl', ['$scope', '$http', '$rootScope', '$modal', '$location', '$routeParams', function($scope, $http, $rootScope, $modal, $location, $routeParams) {
  $rootScope.searchInputText = ""; // Set var to emty string, because if not is 'undefined'
  $scope.change = function () {
    if (angular.isUndefined($scope.searchInput) || $scope.searchInput == null) {
      $rootScope.searchInputText = "";
    }
    else {
      $rootScope.searchInputText = $scope.searchInput;
    }
  }
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
        $rootScope.languageHeader = data.header; // All tags used in HeaderCtrl
        $rootScope.languageSearch = data.search; // All tags used in SearchCtrl
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
            // Save user name in local storage
            window.localStorage['user_name'] = data.user;
            $rootScope.userName = window.localStorage['user_name'];
            // Save token in local storage
            window.localStorage['access_token'] = data.access_token;
            // Close modal
            $scope.cancel();
            // Validate token
            $rootScope.validateToken();
            console.log(data, status);  //remove for production
        })
        .error(function(data, status){
            $scope.showErrors = data.error_description;
            console.log(data, status); //remove for production
      });
      // ***** END API *****
  }
  // ***** END LOGIN USER *****

}])

// **************************************** HASTA ACA LLEGUE ****************************************

.controller('HomeCtrl', ['$scope', '$http', '$rootScope', '$modal', '$location', '$routeParams', function($scope, $http, $rootScope, $modal, $location, $routeParams) {
  // Set the value to variable for updating class active in header menu
  // In this case harcode the URL for showing active HOME in menu, besides the cortoID (if any)
  $rootScope.currentUrl = "/";
  window.scrollTo(0,0);

  // ***** START API ***** Get Destacados titles */*/*/*/*/NOT FINISHED (BAD API)/*/*/*/*/*/
  $scope.slides = "";
  $scope.getDestacados = function() {
    $http({
    method: 'GET',
    url: $rootScope.serverURL + "/api/titulos/destacados/"
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

  // ***** START API ***** Get All titles with filters */*/*/*/*/NOT FINISHED (API NOT DEVELOPED)/*/*/*/*/*/
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
  $scope.getAllGenders = function() {
    $http({
        method: 'GET',
        url: $rootScope.serverURL + "/api/generos"
    })
    .success(function(data, status){

        // Split the results in arrays of 4 elements
        $scope.generos = [];
        while (data.length > 0)
        $scope.generos.push(data.splice(0, 6));

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

    if(genderID == 'all') { // Used when I want the titles from ALL genders
        $http({
          method: 'GET',
          url: $rootScope.serverURL + "/api/titulos"
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
    } else { // Used when I want the titles from ONE gender
        $http({
          method: 'GET',
          url: $rootScope.serverURL + "/api/titulos_serie/" + genderID // CHECK THIS
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
  }
  // ***** END API *****

  // ***** START CAROUSEL *****
  $scope.getDestacados();
  $scope.myInterval = 5000;
  // ***** END CAROUSEL *****

  // ***** START INPUT SEARCH RESULT ***** */*/*/*/*/NOT FINISHED (API NOT DEVELOPED)/*/*/*/*/*/
  // Get value from input search and get data from API
  $scope.showCarousel = true;
  $scope.$watch('searchInputText', function(newValue, oldValue) {
    if (newValue !== oldValue) { // Ignore the initial load when watching model changes
      window.scrollTo(0,0);
      if($rootScope.searchInputText) $scope.showCarousel = false;
      else $scope.showCarousel = true;
      //$scope.searchFestival = ""; uncoment for reseting festivals to all
      $scope.searchBuscador = $rootScope.searchInputText;
      $scope.getFilterTitles(); // This function will be call when $rootScope.searchInputText changes.
    }
  });
  // ***** END INPUT SEARCH RESULT *****

  // ***** START RESULT GENDER TABS *****
  $scope.searchGender = "";
  $scope.searchBuscador = "";
  $scope.getAllGenders();

  $scope.setCurrentGender = function(id, name) {
    $scope.searchGenderName = name;
    $scope.searchGender = id;
    $scope.getTitlesFromGender(id);
  }
  $scope.setCurrentGender('all', 'Todos'); // Get all titles from all genders
  // ***** END RESULT TABS *****

}])

.controller('TitulosDetailCtrl', ['$scope', '$routeParams', '$http', '$rootScope', '$location', '$sce', '$timeout', function($scope, $routeParams, $http, $rootScope, $location, $sce, $timeout) {

  // Set the value to variable for updating class active in header menu
  // In this case harcode the URL for showing active PROYECTOS in menu
  $rootScope.currentUrl = "/titles";
  window.scrollTo(0,0);

  $scope.id = $routeParams.tituloId;

  // ***** START API ***** Get proyecto detail
  $scope.showPreloader = true; // Show preloader gif
  $scope.tituloResult = true; // Set to true for showing label titles
  $http({
      method: 'GET',
      url: $rootScope.serverURL + "/api/titulos/" + $scope.id
  })
  .success(function(data, status){
      $scope.tituloResult = data;
      $scope.showPreloader = false; // Hide preloader gif
      $scope.getRelatedTitles($scope.tituloResult.serie.id); // Get related titles
      console.log(data, status);  //remove for production

  })
  .error(function(data, status){
      $scope.tituloResult = false; // Set to false for showing error pop up
      $scope.showPreloader = false; // Hide preloader gif
      console.log(data, status); //remove for production
  });
  // ***** END API *****

  // ***** START API ***** Get related titles based on this series
  $scope.getRelatedTitles = function(id) {
    $http({
        method: 'GET',
        url: $rootScope.serverURL + "/api/titulos_serie/" + id
    })
    .success(function(data, status){

        // Split the results in arrays of 4 elements
        $scope.relatedTitles = [];
        while (data.length > 0)
        $scope.relatedTitles.push(data.splice(0, 4));

        console.log(data, status);  //remove for production
    })
    .error(function(data, status){
        console.log(data, status); //remove for production
    });
  }
  // ***** END API *****

  // ***** START VIMEP VALIDATION URL *****
  $scope.videoReady = false;
  $scope.trustSrc = function(src) {
    return $sce.trustAsResourceUrl("//player.vimeo.com/video/" + src);
  }

  $timeout(function(){ // Set a delay for avoid showing "wrong video url"
    $scope.videoReady = true;
  }, 2000)
  // ***** END VIMEP VALIDATION URL *****

}])

.controller('RegistroCtrl', ['$scope', '$routeParams', '$http', '$rootScope', '$location', '$sce', function($scope, $routeParams, $http, $rootScope, $location, $sce) {

  // Set the value to variable for updating class active in header menu
  // In this case harcode the URL for showing active PROYECTOS in menu
  $rootScope.currentUrl = "/register";
  window.scrollTo(0,0);

  $scope.getFromFromAPI = function() {
    $scope.showPreloader = true; // Show preloader gif
    $http({
        method: 'GET',
        url: $rootScope.serverURL + "/register/",
    })
    .success(function(data, status){
        $scope.formFromAPI = $scope.renderHtml(data);
        console.log(data, status);  //remove for production
    })
    .error(function(data, status){
        console.log(data, status); //remove for production
    });
  }

  $scope.renderHtml = function(html_code) {
      return $sce.trustAsHtml(html_code);
  };

  $scope.getFromFromAPI();

  // ***** REGISTER USER *****
  $scope.registerNewUser = function(email, username, passFirst, passSecond, token) {
    $scope.sendToAPI = '{"fos_user_registration_form[email]": "' + email + '", "fos_user_registration_form[username]": "' + username + '", "fos_user_registration_form[plainPassword][first]": "' + passFirst + '", "fos_user_registration_form[plainPassword][second]": "' + passSecond + '", "fos_user_registration_form[_token]": "' + token + '"}';
    $http({
        method: 'POST',
        url: $rootScope.serverURL + "/register/",
        data: $scope.sendToAPI,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    })
    .success(function(data, status){
        alert('yeah ' + data);
        console.log(data, status);  //remove for production       
    })
    .error(function(data, status){
        alert('nope ' + data);
        console.log(data, status); //remove for production
    });
  }
  $scope.registerNewUser("asd@asd.com", "jajaja", "asd", "asd", "123");
  // ***** END REGISTER USER *****

}])