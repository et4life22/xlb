# Umami Page View Tracking (if Turbolinks is enabled)
if typeof Turbolinks != 'undefined' and Turbolinks.supported
  document.addEventListener "turbolinks:load", ->
    if window.umami
      umami.trackView()  # Track page view for Turbolinks navigation
else
  if window.umami
    umami.trackView()  # Track initial page load

# Navigation Toggle
document.addEventListener 'DOMContentLoaded', ->
  nav_button = document.querySelector('.nav-button')
  navigation = document.querySelector('.navigation')

  if nav_button and navigation
    nav_button.addEventListener 'click', (event) ->
      navigation.classList.toggle 'open'
      nav_button.classList.toggle 'active'
