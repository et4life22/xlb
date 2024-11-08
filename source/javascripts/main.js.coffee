# Google Analytics
class GoogleAnalytics
  @load: ->
    if window.gtag
      # Initialize Google Analytics (only once)
      gtag('js', new Date())
      gtag('config', GoogleAnalytics.analyticsId())

    # Track page views using Turbolinks or normal navigation
    if typeof Turbolinks != 'undefined' and Turbolinks.supported
      document.addEventListener "turbolinks:load", GoogleAnalytics.trackPageview, true
    else
      GoogleAnalytics.trackPageview()

  @trackPageview: (url) ->
    unless GoogleAnalytics.isLocalRequest()
      if url
        gtag('config', GoogleAnalytics.analyticsId(), {'page_path': url})
      else
        gtag('config', GoogleAnalytics.analyticsId())

  @isLocalRequest: ->
    document.domain.indexOf('dev') isnt -1

  @analyticsId: ->
    'G-CHQHV9P2T6'  # Replace with your GA4 property ID

GoogleAnalytics.load()

# Navigation Toggle
document.addEventListener 'DOMContentLoaded', ->
  nav_button = document.querySelector('.nav-button')
  navigation = document.querySelector('.navigation')

  if nav_button and navigation
    nav_button.addEventListener 'click', (event) ->
      navigation.classList.toggle 'open'
      nav_button.classList.toggle 'active'
