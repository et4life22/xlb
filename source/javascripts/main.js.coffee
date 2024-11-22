# Umami Page View Tracking (if Turbolinks is enabled)
initializeTracking = ->
  if window.umami and typeof window.umami.trackView == 'function'
    umami.trackView()  # Track page view

if typeof Turbolinks != 'undefined' and Turbolinks.supported
  document.addEventListener "turbolinks:load", -> initializeTracking()
else
  document.addEventListener 'DOMContentLoaded', -> initializeTracking()

# Navigation Toggle
document.addEventListener 'DOMContentLoaded', ->
  nav_button = document.querySelector('.nav-button')
  navigation = document.querySelector('.navigation')

  if nav_button and navigation
    nav_button.addEventListener 'click', (event) ->
      navigation.classList.toggle 'open'
      nav_button.classList.toggle 'active'
