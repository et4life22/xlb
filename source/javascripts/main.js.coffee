var nav_button = document.querySelector('.nav-button');
var navigation = document.querySelector('.navigation');

// Listen for click event
nav_button.addEventListener('click', function() {
  // Open navigation and change toggle button
  navigation.classList.toggle('open');
  nav_button.classList.toggle('active');
}, false);

// Initialize Google Analytics
window.dataLayer = window.dataLayer || [];
function gtag() {
  dataLayer.push(arguments);
}
gtag('js', new Date());
gtag('config', 'G-CHQHV9P2T6');
