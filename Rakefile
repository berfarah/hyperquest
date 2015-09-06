require "bundler/gem_tasks"

task :build do
  sh "go build -buildmode=c-shared -o ext/hyperquest.so ext/hyperquest.go"
end

task :benchmark do
  ruby "-Ilib examples/bench.rb"
end
