require "hyperquest"
require "benchmark"

urls = %w(
  http://google.com
  http://bernardo.me
  http://ruby-lang.org
  http://golang.org
  http://news.ycombinator.com
  http://atom.io
  http://sublimetext.com
  http://kapeli.com/dash
  http://github.com
)

Benchmark.bmbm do |r|
  [:head, :get].each do |m|
    r.report("1 request") do
      Hyperquest.public_send(m, urls.shuffle.take(1))
    end

    r.report("3 request") do
      Hyperquest.public_send(m, urls.shuffle.take(3))
    end

    r.report("5 request") do
      Hyperquest.public_send(m, urls.shuffle.take(5))
    end

    r.report("9 request") do
      Hyperquest.public_send(m, urls.shuffle.take(9))
    end
  end
end
