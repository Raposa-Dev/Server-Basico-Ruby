name = "Server CLOSE!"

puts name

require 'webrick'
require './route'

server = WEBrick::HTTPServer.new(Port: 3000)

trap 'INT' do server.shutdown end

server.mount_proc '/index.html' do |request, response|
  HomeRoutes.call(request, response)
end

server.mount_proc '/about.html' do |request, response|
  AboutRoutes.call(request, response)
end

server.start

