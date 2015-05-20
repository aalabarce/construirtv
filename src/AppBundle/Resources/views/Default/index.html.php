<!doctype html>
<html lang="es-ES" ng-app="construirTV">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">

  <!-- Social media tags  UPDATE -->
  <meta name="Title" content="Construir TV aplicación oficial" />
  <meta name="og:title" content="Construir TV aplicación oficial" />
  <meta name="description" content="Mira todos los títulos que quieras!" />
  <meta name="og:description" content="Mira todos los títulos que quieras!" />
  <meta name="og:image" content="http://www.bloodwindow.com/wp-content/uploads/2014/07/OPEN-CALL.jpg" /> <!-- CHANGE -->
  <link rel="image_src" href="http://www.bloodwindow.com/wp-content/uploads/2014/07/OPEN-CALL.jpg" /> <!-- CHANGE -->

	<!-- AngularJS -->
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.0/angular.min.js"></script>

	<!-- Angular Modules -->
  <script src="<?php echo $view['assets']->getUrl('js/app.js') ?>"></script>
  <script src="<?php echo $view['assets']->getUrl('js/controllers.js') ?>"></script>
	<script src="<?php echo $view['assets']->getUrl('js/lib/angular-route.js') ?>"></script>
	<script src="<?php echo $view['assets']->getUrl('js/lib/ui-bootstrap-tpls-0.11.0.min.js') ?>"></script>
  <script src="<?php echo $view['assets']->getUrl('js/lib/angular-smooth-scroll.js') ?>"></script>
  <!--   <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.0/angular-animate.js"></script> -->
  

    <!-- CSS -->
  <link rel="stylesheet" type="text/css" href="<?php echo $view['assets']->getUrl('css/bootstrap.css') ?>" media="all" /> <!-- llamado al CSS de BOOTSTRAP -->
  <link rel="stylesheet" type="text/css" href="<?php echo $view['assets']->getUrl('css/fontello.css') ?>" media="all" /> <!-- llamado a FONTELLO -->
  <link rel="stylesheet" type="text/css" href="<?php echo $view['assets']->getUrl('css/styles.css') ?>" media="all" /> <!-- llamado a MIS STYLES -->
  <link rel="stylesheet" type="text/css" href="<?php echo $view['assets']->getUrl('css/martin-styles.css') ?>" media="all" /> <!-- llamado a MARTIN STYLES -->
  <link href='http://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'> <!-- GOOGLE FONT OSWALD -->
  <!-- JQUERY -->
  <script src="<?php echo $view['assets']->getUrl('js/lib/respond.js') ?>"></script> <!-- llamado a RESPOND para hacer que IE viejos entienda la semantica de HTML5. ESTE VA ARRIBA -->
  
  <title>:: Home   |   Construir TV ::</title>
  <link rel="shortcut icon" href="/web/favicon.ico" type="theme/image/x-icon">

</head>

<body>

  <div class="container-fluid"> <!-- contenedor principal -->

    <!-- header -->
    <header class="navbar navbar-default navbar-fixed-top headerMain" ng-controller="HeaderCtrl">
      <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-8 logoHeader">
          <a class="navbar-brand" href="#">
            <img class="img-responsive" src="{{themeImagesSrc}}/logo.png" alt="" />
          </a>
        </div>
        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-4 menuHeader">
          <p class="logueado pull-right" ng-show="userName"> <!-- Show when user is logged in -->
            <span>{{userName}}</span>
            <a href="javascript:void(0)" ng-click="userLogout()" class="pull-right">cerrar</a>
          </p>
          <p ng-hide="userName"> <!-- Show when user is not logged in -->
            <a data-toggle="modal" class="pointer-login" ng-click="openLogin()">Iniciar sesion</a>
            <a href="#register" class="btn-reg">Registrarse</a>
          </p>
        </div>
      </div>
    </header>

    <div class="clearfix"></div>
        <!-- VIEW OPTIONS
          <div class="hidden-xs buscador" ng-class="'/' != currentUrl && 'vis-hidden'">
            <input type="search" class="form-control" placeholder="{{languageHeader.inputSearch}}" ng-model="searchInput" ng-change="change()">
            <a class="glyphicon glyphicon-search btn-lupa"></a>
          </div>

          <a ng-click="registerNewUser('asd@test.com', 'martin', '123', '123')">Crear usuario</a>

        -->
      
    <!--buscador -->
    <div class="buscador col-lg-6 col-md-6 col-sm-6 col-xs-12 col-lg-offset-3 col-md-offset-3 col-sm-offset-3 col-xs-offset-3" ng-class="'/' != currentUrl && 'vis-hidden'" ng-controller="SearchCtrl">
      <input type="search" class="form-control" placeholder="{{languageSearch.inputSearch}}" ng-model="searchInput"  ng-model-options="{debounce: 1000}" ng-change="change()">
      <a ng-hide="searchInput" class="glyphicon glyphicon-search btn-lupa"></a>
      <a ng-show="searchInput" ng-click="cancelSearch()" href="javascript:void(0)" class="glyphicon glyphicon-remove btn-lupa"></a>
    </div>
    
    <div class="clearfix"></div>

    <!-- cambiar idiaoma -->
    <div ng-controller="languageCtrl"></div>

    <!-- main content + footer -->
    <div class="bg-cemento">
      <section class="main-cont">

        <!-- Here is where the HTML is load depending on the URL -->
        <div ng-view class="fade-in">
        </div>

      </section>
    </div>

    <div class="clearfix"></div>
    
    <footer class="navbar navbar-default redes" ng-controller="HeaderCtrl">

<!--<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center" style="margin: 0 0 4em;">
          <a href="#" class="btn btn-lg btn-success btn-blood" data-toggle="modal" data-target="#detalle-video-modal">Click to open Modal</a>
        </div>-->
        <div class="clearfix"></div>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">&nbsp;</div>
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 text-center">
          <a href="https://www.facebook.com/construirtv" target="_blank">
            <div class="item-red">
              <i class="icon-facebook text-center" alt="Facebook"></i>
            </div>
          </a>
        </div>
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 text-center">
          <a href="https://twitter.com/construirtv" target="_blank">
            <div class="item-red">
              <i class="icon-twitter text-center" alt="Twitter"></i>
            </div>
          </a>
        </div>
        <!--
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 text-center">
          <a href="#">
            <div class="item-red">
              <i class="icon-instagram text-center" href="#" alt="Instagram"></i>
            </div>
          </a>
        </div>
        -->
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 text-center">
          <a href="https://www.youtube.com/user/construirtv" target="_blank">        
            <div class="item-red">
              <i class="icon-youtube text-center" alt="Youtube"></i>
            </div>
          </a>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">&nbsp;</div>

        <div class="clearfix"></div>
        <div class="hidden-xs"><br /><br /><br /><br /></div>

      <!--
      <div class="col-lg-2 col-md-2 col-sm-2 hidden-xs">&nbsp;</div>
      
      <nav class="menufut col-lg-8 col-md-8 col-sm-8 col-xs-12">
        <ul class="list-inline text-center">
          <li ng-repeat="page in languageHeader.menu" class="text-center"><a href="#{{page.url}}" alt="{{page.title}}">{{page.title}}</a></li>
        </ul> 
      </nav>
      
      <div class="col-lg-2 col-md-2 col-sm-2 hidden-xs">&nbsp;</div>
      -->
      
    </footer>
    <div class="clearfix"></div>
    <p class="copyright text-center">
      Copyright © 2015  - All rights reserved - Powered by <a href="http://walrussolutions.com/" target="_blank">Walrus Solutions</a>
    </p>
  </div>
	
</body>
</html>