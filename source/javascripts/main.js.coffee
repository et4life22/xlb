nav_button = document.querySelector('.nav-button')
navigation = document.querySelector('.navigation')

# Listen for click event
nav_button.addEventListener 'click', (->

  # open navigation and change toggle button
  navigation.classList.toggle 'open'
  nav_button.classList.toggle 'active'
), false

# google_analytics.coffee
class GoogleAnalytics
  @load: ->
    # Check if gtag is defined and then initialize tracking
    if window.gtag
      gtag('js', new Date())
      gtag('config', GoogleAnalytics.analyticsId())

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
    'G-CHQHV9P2T6'  # Your GA4 property ID

GoogleAnalytics.load()
