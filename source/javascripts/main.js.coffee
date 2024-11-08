// Add a listener to toggle the navigation button
document.addEventListener('DOMContentLoaded', function () {
  var nav_button = document.querySelector('.nav-button');
  var navigation = document.querySelector('.navigation');

  if (nav_button) {
    nav_button.addEventListener('click', function () {
      // open navigation and change toggle button
      navigation.classList.toggle('open');
      nav_button.classList.toggle('active');
    });
  }

  // Google Analytics setup
  window.dataLayer = window.dataLayer || [];
  function gtag() { dataLayer.push(arguments); }
  gtag('js', new Date());
  gtag('config', 'G-CHQHV9P2T6');
});
