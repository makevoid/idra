require 'spec_helper'


describe Idra do

  let(:idra) { Idra.new }

  it "should init Hydra" do
    hydra = idra.instance_variable_get("@hydra")
    hydra.should be_a Typhoeus::Hydra
  end

  it "should add a request" do
    idra.add_request :example, "http://example.com"
    idra.requests.count.should == 1
  end

  context "stubbed out" do
    before do
      typhoeus_stub "http://example.com" => "{}"
      typhoeus_stub /stub/               => { stub: true }.to_json

      idra.add_request :example, "http://example.com"
      idra.add_request :stub,    "http://stub.com"
    end

    it "runs and yields the responses" do
      idra.response_for :example do |response|
        response.body.should == "{}"
      end

      idra.response_for :stub do |response|
        response.body.should == '{"stub":true}'
      end
    end

    it "runs and yields responses (block form)" do
      response = idra.response_for :example
      response.body.should == "{}"
    end

    context "normal run" do
      it "should run and yield the requests" do
        idra.enabled.should be_truthy
        idra.run do |request|
          request.response.body.should == "{}"
          break
        end
      end
    end
  end

end
