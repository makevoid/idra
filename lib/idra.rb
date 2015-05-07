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
    @enabled = true
  end

  alias :enabled? :enabled

  protected

  def run_hydra
    @hydra.run if enabled?
    @enabled = false
    true
  end

end
