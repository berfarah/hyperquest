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

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/berfarah/hyperquest/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
