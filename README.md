# Hyperquest

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hyperquest'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hyperquest

## Usage

```ruby
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
```

## Development

This gem is powered by [Go 1.5](https://golang.org/dl/)'s functionality of creating shared C libraries.

If you're on a mac, you can also install Go with [homebrew](http://brew.sh): `brew install go`. Please remember to `bundle` first!

## Contributing

1. Fork it ( https://github.com/berfarah/hyperquest/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
