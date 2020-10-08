nav_button = document.querySelector('.nav-button')
navigation = document.querySelector('.navigation')

# Listen for click event
nav_button.addEventListener 'click', (->

  # open navigation and change toggle button
  navigation.classList.toggle 'open'
  nav_button.classList.toggle 'active'
), false

<!-- Global site tag (gtag.js) - Google Analytics -->
<
script async src = "https://www.googletagmanager.com/gtag/js?id=UA-131389856-1" > < /script> <
    script >
    window.dataLayer = window.dataLayer || [];

function gtag() { dataLayer.push(arguments); }
gtag('js', new Date());

gtag('config', 'UA-131389856-1'); <
/script>
