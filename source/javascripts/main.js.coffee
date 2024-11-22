# Function to track page views with Umami
initializeTracking = ->
  if window.umami and typeof window.umami.trackView == 'function'
    # Get current page information
    pagePath = window.location.pathname
    pageTitle = document.title
    # Send tracking data to Umami
    umami.trackView(pagePath, pageTitle)

# Add event listeners for tracking page views
addPageViewTracking = ->
  if typeof Turbolinks != 'undefined' and Turbolinks.supported
    # For Turbolinks-based navigation
    document.addEventListener "turbolinks:load", -> initializeTracking()
  else
    # For standard full page loads
    document.addEventListener 'DOMContentLoaded', -> initializeTracking()

# Navigation toggle functionality
setupNavigationToggle = ->
  document.addEventListener 'DOMContentLoaded', ->
    nav_button = document.querySelector('.nav-button')
    navigation = document.querySelector('.navigation')

    if nav_button and navigation
      nav_button.addEventListener 'click', (event) ->
        navigation.classList.toggle 'open'
        nav_button.classList.toggle 'active'

# Call functions to initialize tracking and navigation toggle
addPageViewTracking()
setupNavigationToggle()
