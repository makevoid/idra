module TyphoeusHelpers
  def typhoeus_stub(response)
    Typhoeus.stub(response.keys.first) do
      Typhoeus::Response.new(body: response.values.first)
    end
  end
end

# if this helper is not enough for you, use Typhoeus.stub it manually:
#
# Typhoeus.stub("http://example.com") do
#   Typhoeus::Response.new(body: "{}")
# end
