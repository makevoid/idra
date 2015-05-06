require 'typhoeus'

class Hydro
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
# hydro = Hydro.new
#
# hydro.add_request "https://api.github.com/users/i0rek"
# hydro.add_request "https://api.github.com/users/makevoid"
# hydro.add_request "https://api.github.com/users/pauldix"
# hydro.add_request "https://api.github.com/users/dbalatero"
#
# hydro.run do |request|
#   puts request.response.body
# end
