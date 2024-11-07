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
        # Load the analytics code
        window.dataLayer = window.dataLayer || []

        # Add the Google Analytics script dynamically
        googleScript = document.createElement("script")
        googleScript.async = true
        googleScript.src = 'https://www.googletagmanager.com/gtag/js?id=' + GoogleAnalytics.analyticsId()
        firstScript = document.getElementsByTagName("script")[0]
        firstScript.parentNode.insertBefore googleScript, firstScript

        # Initialize gtag
        window.dataLayer.push({'event': 'jsLoad', 'gtm.start': new Date().getTime()})
        
        # Set up gtag function if it's not already set
        window.gtag = (arguments...) ->
            window.dataLayer.push arguments

        gtag('js', new Date())
        gtag('config', GoogleAnalytics.analyticsId())
        
        # Track page views based on Turbolinks or regular page loads
        if typeof Turbolinks isnt 'undefined' and Turbolinks.supported
            document.addEventListener "turbolinks:load", GoogleAnalytics.trackPageview, true
        else
            GoogleAnalytics.trackPageview()
    
    @trackPageview: (url) ->
        unless GoogleAnalytics.isLocalRequest()
            # Set page path based on URL if available
            gtag('config', GoogleAnalytics.analyticsId(), {'page_path': url || location.pathname})
    
    @isLocalRequest: ->
        document.domain.indexOf('dev') isnt -1
    
    @analyticsId: -> 'G-CHQHV9P2T6'  # Replace with your GA4 property ID

# Initialize Google Analytics
GoogleAnalytics.load()
