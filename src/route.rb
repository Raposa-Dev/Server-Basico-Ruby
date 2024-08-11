require 'webrick'

module HomeRoutes
  def self.call(request, response)
    response.status = 200
    response.content_type = 'text/html'
    response.body = File.read('../index.html')
  end
end

module AboutRoutes
  def self.call(request, response)
    response.status = 200
    response.content_type =   'text/html'
    response.body = File.read('../about.html')
  end
end  
