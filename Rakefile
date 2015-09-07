require "bundler/gem_tasks"

task :xbuild do
  # [:darwin, :linux].each do |os|
  #   sh "GOOS=#{os} GOARCH=amd64 go build -buildmode=c-shared -o ext/hyperquest-#{os}X86_64.so ext/hyperquest.go"
  # end
  sh "go build -buildmode=c-shared -o ext/hyperquest.so ext/hyperquest.go"
end

task :bench do
  ruby "-Ilib examples/bench.rb"
end
