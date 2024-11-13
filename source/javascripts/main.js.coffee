# Navigation Toggle
document.addEventListener 'DOMContentLoaded', ->
  nav_button = document.querySelector('.nav-button')
  navigation = document.querySelector('.navigation')

  if nav_button and navigation
    nav_button.addEventListener 'click', (event) ->
      navigation.classList.toggle 'open'
      nav_button.classList.toggle 'active'
