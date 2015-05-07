require 'typhoeus'
require_relative "idra/version"

class Typhoeus::Request
  attr_accessor :name
end

class Idra
  attr_reader :requests
  attr_reader :enabled

  def initialize
    @hydra    = Typhoeus::Hydra.new
    @requests = []
    @enabled  = true
  end

  def add_request(name, *request)
    request      =  Typhoeus::Request.new *request
    request.name =  name
    @requests    << request
    @hydra.queue    request
    request
  end

  def response_for(name, &block)
    run_hydra
    request  = @requests.find{ |req| req.name == name }
    response = request.response
    if block
      block.call response
    else
      response
    end
  end

  def run(&block)
    run_hydra
    @requests.each do |req|
      block.call req if block
    end
  end

  def refresh
    @enabled = false
  end

  alias :enabled? :enabled

  protected

  def run_hydra
    @hydra.run if enabled?
    @enabled = false
    true
  end

end

# usage:
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
