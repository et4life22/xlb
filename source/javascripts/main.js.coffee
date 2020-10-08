nav_button = document.querySelector('.nav-button')
navigation = document.querySelector('.navigation')

# Listen for click event
nav_button.addEventListener 'click', (->

  # open navigation and change toggle button
  navigation.classList.toggle 'open'
  nav_button.classList.toggle 'active'
), false

activate :google_analytics do |ga|
  # Property ID (default = nil)
  ga.tracking_id = 'UA-131389856-1'

  # Removing the last octet of the IP address (default = false)
  ga.anonymize_ip = false

  # Tracking across a domain and its subdomains (default = nil)
  ga.domain_name = 'example.com'

  # Tracking across multiple domains and subdomains (default = false)
  ga.allow_linker = false

  # Enhanced Link Attribution (default = false)
  ga.enhanced_link_attribution = false

  # Container ID for Google Optimize (A/B Testing)
  ga.optimize = 'GTM-123456'

  # Log detail messages to the console (default = false)
  ga.debug = false

  # Trace debugging will output more verbose information to the console (default = false)
  ga.debug_trace = false

  # Disable extension (default = false)
  ga.disable = true

  # Testing your implementation without sending hits (default = true) in development
  ga.test = true

  # Compress the JavaScript code (default = false)
  ga.minify = false

  # Output style - :html includes <script> tag (default = :html)
  ga.output = :js

end
