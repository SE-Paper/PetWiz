<!DOCTYPE html>
<html xmlns:fb="">
<head>

    <title>Index</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <asset:stylesheet src="materialize.min.css" media="screen,projection"/>
    <asset:stylesheet src="style.css"/>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:800italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato:900' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Vollkorn:700' rel='stylesheet' type='text/css'>

</head>
<body>
<!-- FB Script -->
<script>
    // This is called with the results from from FB.getLoginStatus().
    function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        console.log(response);

        // The response object is returned with a status field that lets the
        // app know the current login status of the person.
        // Full docs on the response object can be found in the documentation
        // for FB.getLoginStatus().
        if (response.status === 'connected') {
            // Logged into your app and Facebook.
            testAPI();
        } else if (response.status === 'not_authorized') {
            // The person is logged into Facebook, but not your app.
            document.getElementById('status').innerHTML = 'Please log ' +
                    'into this app.';
        } else {
            // The person is not logged into Facebook, so we're not sure if
            // they are logged into this app or not.
            document.getElementById('status').innerHTML = 'Please log ' +
                    'into Facebook.';
        }
    }

    // This function is called when someone finishes with the Login
    // Button.  See the onlogin handler attached to it in the sample
    // code below.
    function checkLoginState() {
        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });
    }

    window.fbAsyncInit = function() {
        FB.init({
            appId      : '988173204609860',
            cookie     : true,  // enable cookies to allow the server to access
                                // the session
            xfbml      : true,  // parse social plugins on this page
            version    : 'v2.5' // use graph api version 2.5
        });

        // Now that we've initialized the JavaScript SDK, we call
        // FB.getLoginStatus().  This function gets the state of the
        // person visiting this page and can return one of three states to
        // the callback you provide.  They can be:
        //
        // 1. Logged into your app ('connected')
        // 2. Logged into Facebook, but not your app ('not_authorized')
        // 3. Not logged into Facebook and can't tell if they are logged into
        //    your app or not.
        //
        // These three cases are handled in the callback function.

        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });

    };

    // Load the SDK asynchronously
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/es_LA/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    // Here we run a very simple test of the Graph API after login is
    // successful.  See statusChangeCallback() for when this call is made.
    function testAPI() {
        console.log('Welcome!  Fetching your information.... ');
        FB.api('/me', function(response) {
            console.log('Successful login for: ' + response.name);
            document.getElementById('status').innerHTML =
                    'Thanks for logging in, ' + response.name + '!';
        });
    }
</script>

<!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.


    <div id="status">
    </div>

-->

<!-- Header -->
<header class="">

</header>

<!-- Nav -->
<div class="navbar-fixed">
    <nav class="nav-wrapper petwiz-blue">
        <div class="row">
            <!------------------- lateral Nav Bar---------------------------->
            <div class="col s2 m1 l1 left">
                <a href="#" data-activates="nav-lat" class="button-collapse"><i class="material-icons">menu</i></a>
                <ul id="nav-lat"  class="side-nav petwiz-teal petwiz-letra1">
                    <li><a href="" class="white-text"><i class="left material-icons">search</i>Buscar</a></li>
                    <li><a href="" class="white-text"><i class="left material-icons">help</i>Ayuda</a></li>
                    <li><a href="" class="white-text"><i class="left material-icons">more_vert</i>About Us</a></li>
                </ul>
            </div>
                <!-------------------------Nav Responsive menu--------------------------->
            <div class="left margin-left">
                <a href=""><img src="https://41.media.tumblr.com/4255698e1f0bf60cc578b3e41e1102c2/tumblr_o3y01dJzcZ1solvhmo1_400.png" width=110px height="auto"/></a>
            </div>
            <div class="col s9 m1 l9 right ">
                <ul class="hide-on-med-and-down right">
                    <li><a href=""><i class="material-icons">search</i></a></li>
                    <li><a href="${createLink(uri:'/index/PetWizTeam.gsp')}"><i class="material-icons">help</i></a></li>
                    <li><a href="${createLink(uri:'/person/home.gsp')}"><i class="material-icons">more_vert</i></a></li>
                </ul>
            </div>

        </div>
    </nav>
</div>

<div class="parallax-container row">
    <div class="parallax"><asset:image src="login11.jpg"/></div>
    <br><br><br><br><br><br><br><br>
    <div class="container center petwiz-opacity">
        <h1 class="header white-text text-lighten-2 big-size-text petwiz-font">
            <span>
                PetWiz
            </span>
        </h1>
        <div class="row">
            <h5 class="header petwiz-letra1">Lo mejor para ti y tus mascotas</h5>
        </div>
        <div class="row">
            <!--
              <a href="" scope="public_profile,email" onlogin="checkLoginState();" class="waves-effect btn-large reg-btn">Inicia con Facebook</a>
             <a scope="public_profile,email" onlogin="checkLoginState();" class="fb-login-button">Inicia con Facebook</a>

             <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
            </fb:login-button>
            -->

            <div class="fb-login-button" data-max-rows="1" data-size="xlarge" data-show-faces="false" data-auto-logout-link="false"
                 scope="public_profile,email" onlogin="checkLoginState();">Inicia con Facebook</div>
        </div>

    </div>


</div>

<!--
<div class="fb-login-button" data-max-rows="1" data-size="xlarge" data-show-faces="false" data-auto-logout-link="false"></div>
-->

<div class="petwiz-blue no-mar-top row transparent"></div>
<div class="petwiz-blue  row transparent"></div>
<div class="petwiz-blue  row transparent"></div>
<div class="petwiz-blue  row transparent"></div>


<footer class="petwiz-footer petwiz-blue">
    <div class="container">
        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text petwiz-font">PetWiz Info</h5>
                <p class="grey-text text-lighten-4">Esta apliación es la mejor para que tu y tus mascotas puedan compartir los mejores momentos. Aquí encontrarás multiples eventos y servicios a los cuáles tu mascota podrá asistir y disfrutar para que tu puedas devolver todo el cariño que el te brinda.</p>
            </div>
            <div class="col">
                <h5 class="col white-text">Unete:</h5>
            </div>
            <ul class="col petwiz-conn-ico-container">
                <li class="petwiz-conn-ico inverse right">
                    <a href="http://www.twitter.com/petwiz_2016">
                        <img src="https://s3.amazonaws.com/codecademy-content/projects/make-a-website/lesson-4/twitter.svg" width=40px height="auto"/>
                    </a>
                </li>
                <li class="petwiz-conn-ico inverse right">
                    <a href="https://www.instagram.com/petwizweb/">
                        <img src="https://s3.amazonaws.com/codecademy-content/projects/make-a-website/lesson-4/instagram.svg"
                             width=40px height="auto"/>
                    </a>
                </li>
                <li class="petwiz-conn-ico inverse right">
                    <a href="">
                        <img src="https://s3.amazonaws.com/codecademy-content/projects/make-a-website/lesson-4/facebook.svg"
                             width=40px height="auto"/>
                    </a>
                </li>
            </ul>
        </div>

    </div>

</footer>
<div class="petwiz-blue">
    <br><br>
    <br><br>
</div>
<div class="petwiz-blue hide-on-med-and-up">
    <br><br>
    <br><br>
</div>

<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<asset:javascript src="materialize.js"/>
<asset:javascript src="init.js"/>


</body>
</html>