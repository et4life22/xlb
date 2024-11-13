# Google Analytics Setup
(function() {
  var script = document.createElement("script");
  script.src = "https://www.googletagmanager.com/gtag/js?id=G-CHQHV9P2T6";
  script.async = true;
  document.head.appendChild(script);

  script.onload = function() {
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'G-CHQHV9P2T6');
  };
})();

# Navigation Toggle
document.addEventListener 'DOMContentLoaded', ->
  nav_button = document.querySelector('.nav-button')
  navigation = document.querySelector('.navigation')

  if nav_button and navigation
    nav_button.addEventListener 'click', (event) ->
      navigation.classList.toggle 'open'
      nav_button.classList.toggle 'active'
