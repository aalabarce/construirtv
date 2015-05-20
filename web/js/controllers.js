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
      templateUrl: '../templates/modals/modal.login.html',
      controller: 'LoginCtrl',
      size: 'lg',
      backdrop: 'static',
      keyboard: false
    });

  };
  // ***** END OPEN MODAL LOGIN *****

  // ***** LOOK IN LOCAL STORAGE FOR VALID TOKEN *****
  $rootScope.validateToken = function() {
    $rootScope.confirmedToken = false; // Token has not been confirmed
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
            $rootScope.confirmedToken = true; // Token has been confirmed, user can acces to titulos data
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

  $scope.$watch('searchInputText', function(newValue, oldValue) {
    if (newValue !== oldValue) { 
      $scope.searchInput = $rootScope.searchInputText;
    }
  });

  $scope.cancelSearch = function() {
    $rootScope.searchInputText = "";
  }

}])

.controller('languageCtrl', ['$scope', '$http', '$rootScope', function($scope, $http, $rootScope) {
  
  $rootScope.language = "eng"; // Set default language to Spanish

  // ***** SET LENGUAGUE *****
  $scope.setLanguage = function(thisLanguage) {
    $rootScope.language = thisLanguage;
    $http({
    method: 'GET',
    url: "../languages/" + thisLanguage + ".json"
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
    //If location "/" don't reload
    $location.path("/").replace(); // If user quits login, redirect to home
    $modalInstance.close(); // Close modal after redirecting
  };

  $scope.cancel = function () {
    $modalInstance.dismiss('cancel');
  };
  // ***** END MODAL CLOSE FUNCTIONS *****


  // ***** LOGIN USER *****
  $scope.errorLogin = false; // Hide error msg
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
            //$scope.showErrors = data.error_description;
            $scope.errorLogin = true; // Show error msg
            console.log(data, status); //remove for production
      });
      // ***** END API *****
  }
  // ***** END LOGIN USER *****
  
  // ***** REDIRECT USER TO REGISTRATION *****
  $scope.userGoToRegister = function() {
    $location.path("/register").replace(); // If user quits login, redirect to home
    $modalInstance.close(); // Close modal after redirecting
  }
  // ***** END REDIRECT USER TO REGISTRATION *****

}])

.controller('HomeCtrl', ['$scope', '$http', '$rootScope', '$modal', '$location', '$routeParams', function($scope, $http, $rootScope, $modal, $location, $routeParams) {
  // Set the value to variable for updating class active in header menu
  // In this case harcode the URL for showing active HOME in menu, besides the cortoID (if any)
  $rootScope.currentUrl = "/";
  $rootScope.searchInputText = "";
  window.scrollTo(0,0);

  // ***** START API ***** Get Destacados titles
  $scope.slides = "";
  $scope.getDestacados = function() {
    $http({
    method: 'GET',
    url: $rootScope.serverURL + "/api/titulos_destacados/"
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

  // ***** START API ***** Get All titles with filters
  $scope.filterTitles = true; // Set var to true for not showing error message
  $scope.getFilterTitles = function() {
    $scope.showPreloader = true; // Show preloader gif
    if($scope.searchBuscador) { // If the search input is not empty
      $http({
          method: 'GET',
          url: $rootScope.serverURL + "/api/buscar/" + $scope.searchBuscador
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
    } else { // When the search input is empty
      $scope.setCurrentGender('all', 'Todos'); // Get all titles from all genders
    }
  }
  // ***** END API *****

  // ***** START API ***** Get all Genders for filter
  $scope.getAllGenders = function() {
    $http({
        method: 'GET',
        url: $rootScope.serverURL + "/api/generos"
    })
    .success(function(data, status){

        // Add 'todos' to api result before spliting the array. Set id to 'all' for genting all titles in getTitlesFromGender
        data.unshift({'nombre': 'Todos', 'id': 'all'});
        
        // Split the results in arrays of 6 elements
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
          url: $rootScope.serverURL + "/api/titulos_genero/" + genderID
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
      if($rootScope.searchInputText) {
        $scope.showCarousel = false;
      }
      else {
        $scope.showCarousel = true;
      }
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

  // Check if Token has been confirmed or not before colling API
  $scope.$watch('confirmedToken', function(newValue, oldValue) {
    if (newValue !== oldValue) { // Ignore the initial load when watching model changes
      if($rootScope.confirmedToken) $scope.getTitleDetails(); // Token has been confirmed, call the API and get the titulo data
      else return; // Do nothing
    }
  });

  // ***** START API ***** Get proyecto detail
  $scope.showPreloader = true; // Show preloader gif
  $scope.tituloResult = true; // Set to true for showing label titles
  $scope.getTitleDetails = function() {
    $http({
        method: 'GET',
        url: $rootScope.serverURL + "/api/titulos/" + $scope.id + "?access_token=" + window.localStorage['access_token']
    })
    .success(function(data, status){ // If token is OK
        $scope.tituloResult = data;
        $scope.showPreloader = false; // Hide preloader gif
        $scope.getRelatedTitles($scope.tituloResult.serie.id); // Get related titles
        console.log(data, status);  //remove for production

        $scope.loadHTMLplayer = $sce.trustAsHtml('<iframe ng-show="videoReady" src="//player.vimeo.com/video/' + $scope.tituloResult.urlVimeo + '?wmode=transparent" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen class="img-responsive"></iframe>');
    })
    .error(function(data, status){ // If token has expired
        $scope.tituloResult = false; // Set to false for showing error pop up
        $scope.showPreloader = false; // Hide preloader gif
        console.log(data.error_description);
        //$location.path("/").replace(); // Redirect to home
        console.log(data, status); //remove for production
    });
  }
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

}])

.controller('RegistroCtrl', ['$scope', '$routeParams', '$http', '$rootScope', '$location', '$sce', function($scope, $routeParams, $http, $rootScope, $location, $sce) {

  // Set the value to variable for updating class active in header menu
  // In this case harcode the URL for showing active PROYECTOS in menu
  $rootScope.currentUrl = "/register";
  window.scrollTo(0,0);

 // ***** GET THE TOKEN FROM THE FORM TO REGISTER NEW USER *****
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

  $scope.renderHtml = function(html_code) { // Render text as HTML
      return $sce.trustAsHtml(html_code);
  };

  $scope.getFromFromAPI();
  // ***** END GET THE TOKEN FROM THE FORM TO REGISTER NEW USER *****

  // ***** REGISTER USER *****
  $scope.registerNewUser = function() {

    //var email = document.getElementById("fos_user_registration_form_email").value; // Get email value from form
    //var username = document.getElementById("fos_user_registration_form_username").value; // Get username value from form
    //var passFirst = document.getElementById("fos_user_registration_form_plainPassword_first").value; // Get first pass value from form
    //var passSecond = document.getElementById("fos_user_registration_form_plainPassword_second").value; // Get second pass value from form
    
    var token = document.getElementById("fos_user_registration_form__token").value; // Get token value from the form returned by the firt API call

    $http({
        method: 'POST',
        url: $rootScope.serverURL + "/register/",
        data: {
          'fos_user_registration_form[email]': $scope.userEmailImput,
          'fos_user_registration_form[username]': $scope.userNamelImput,
          'fos_user_registration_form[plainPassword][first]': $scope.userPassImput,
          'fos_user_registration_form[plainPassword][second]': $scope.userPass2Imput,
          'fos_user_registration_form[_token]': token
        },
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        transformRequest: function(obj) {
        var str = [];
        for(var p in obj)
        str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
        return str.join("&");
      }
    })
    .success(function(data, status){
        $scope.checkForErrors(data);
        console.log(data, status);  //remove for production
    })
    .error(function(data, status){
        console.log(data, status); //remove for production
    });
  }
  // ***** END REGISTER USER *****

  // ***** CHECK REGISTRATION ERRORS *****
  $scope.checkForErrors = function(data) {

    $scope.emailUsed = false;
    $scope.emailInvalid = false;
    $scope.userlUsed = false;
    $scope.passwordsNotMatching = false;
    $scope.passwordsTooShort = false;

    // Email already used
    if (data.indexOf("La dirección de correo ya está en uso") != -1) {
      $scope.emailUsed = true;
    }
    // Not valid email
    if (data.indexOf("La dirección de correo no es válida") != -1) {
      $scope.emailInvalid = true;
    }
    // User already used
    if (data.indexOf("El nombre de usuario ya está en uso") != -1) {
      $scope.userlUsed = true;
    }
    // Pasword not matching
    if (data.indexOf("Las dos contraseñas no coinciden") != -1) {
      $scope.passwordsNotMatching = true;
    }
    // Pasword too short
    if (data.indexOf("La contraseña es demasiado corta") != -1) {
      $scope.passwordsTooShort = true;
    }
    // No errors
    if($scope.emailUsed == false && $scope.emailInvalid == false && $scope.userlUsed == false && $scope.passwordsNotMatching == false && $scope.passwordsTooShort == false) {
      $scope.userLoginAfterRegistration($scope.userEmailImput, $scope.userPassImput); // Log in the user
      $location.path("/welcome").replace(); // Redirect to welcome after login
    }

  }
  // ***** END CHECK REGISTRATION ERRORS *****

  // ***** LOGIN USER (SIMPLER VERSION) *****
  $scope.userLoginAfterRegistration = function(email, password) {
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
            // Validate token
            $rootScope.validateToken();
        })
        .error(function(data, status){
            $scope.errorLogin = true; // Show error msg
            console.log(data, status); //remove for production
      });
      // ***** END API *****
  }
  // ***** END LOGIN USER (SIMPLER VERSION) *****

}])

.controller('WelcomeCtrl', ['$scope', '$routeParams', '$http', '$rootScope', '$location', '$sce', function($scope, $routeParams, $http, $rootScope, $location, $sce) {
  //Do something
}])