require 'typhoeus'

class Idra
  def initialize
    @hydra    = Typhoeus::Hydra.new
    @requests = []
  end

  def add_request(*request)
    request   =  Typhoeus::Request.new *request
    @requests << request
    @hydra.queue request
  end

  def run(&block)
    @hydra.run
    @requests.each{ |req| block.call req }
  end
end

# usage
#
# idra = Idra.new
#
# idra.add_request "https://api.github.com/users/i0rek"
# idra.add_request "https://api.github.com/users/makevoid"
# idra.add_request "https://api.github.com/users/pauldix"
# idra.add_request "https://api.github.com/users/dbalatero"
#
# idra.run do |request|
#   puts request.response.body
# end
