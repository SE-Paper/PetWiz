/**
 * Created by Andres on 25/04/2016.
 */
window.fbAsyncInit = function () {

    FB.init({
        appId: '1525277721114792',
        status: true,
        cookie: true,
        xfbml: true,
        version: 'v2.1'
    });
};

function faceLogout() {
    FB.logout(function(response) {
        logout();
    });
}
$(document).on('click', '#logout', function(e) {
    e.preventDefault();

    faceLogout();
});