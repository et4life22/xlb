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
        # Initialize dataLayer
        window.dataLayer = window.dataLayer || []

        # Load the gtag.js script asynchronously
        googleScript = document.createElement("script")
        googleScript.async = true
        googleScript.src = 'https://www.googletagmanager.com/gtag/js?id=' + GoogleAnalytics.analyticsId()
        firstScript = document.getElementsByTagName("script")[0]
        firstScript.parentNode.insertBefore googleScript, firstScript

        # Define the gtag function
        window.gtag = (arguments...) ->
            window.dataLayer.push(arguments)

        # Configure gtag with the GA4 ID
        gtag('js', new Date())
        gtag('config', GoogleAnalytics.analyticsId())
        
        # Track pageviews on navigation changes
        if typeof Turbolinks isnt 'undefined' and Turbolinks.supported
            document.addEventListener "turbolinks:load", GoogleAnalytics.trackPageview, true
        else
            GoogleAnalytics.trackPageview()
    
    # Function to track page views
    @trackPageview: (url) ->
        unless GoogleAnalytics.isLocalRequest()
            if url
                gtag('config', GoogleAnalytics.analyticsId(), {'page_path': url})
            else
                gtag('config', GoogleAnalytics.analyticsId())

    # Check if request is local (to skip GA tracking)
    @isLocalRequest: ->
        document.domain.indexOf('dev') isnt -1

    # Define the Google Analytics ID
    @analyticsId: ->
        'G-CHQHV9P2T6'  # Replace with your GA4 property ID
        
GoogleAnalytics.load()
