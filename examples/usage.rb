require "hyperquest"

h = Hyperquest.get([url1, url2, url3])
# => Hash<url1 => Response, url2 => Response, url3 => Response>

h = Hyperquest.head([url1, url2, url3])
# => Hash<url1 => Response, url2 => Response, url3 => Response>

h[url1].uri
# => "http://example.com"
h[url1].content_length
# => 2435
h[url1].content_type
# => "text/html; charset UTF-8"
h[url1].body
# => "<HTML..."
h[url1].status
# => 200
h[url1].error
# => ""
h[url1].success?
# => true
h[url1].failed?
# => false
