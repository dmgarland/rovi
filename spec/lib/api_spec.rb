require 'spec_helper'

describe Rovi::Api do
  
  describe "A call to the data service album info endpoint" do
    before do
      params = {
        :albumid => "MW0000111184" 
      }
      
      Timecop.freeze(Time.local(2012, 1, 1)) do
        @api = Rovi::Api.new("12345", "54321")
      end
    end
    
    after do
      Timecop.return
    end
    
    it 'should know the right endpoint for the data service' do
      @api.instance_variable_set(:@api_function, "album")
      @api.instance_variable_set(:@api_function_request, "info")
      @api.send(:endpoint).should == "http://api.rovicorp.com/data/v1/album/info"
    end
    
    it 'should calculate the sig from the MD5 of the access key, secret and the current unix time' do
      Timecop.freeze(Time.local(2012, 1, 1)) do
        @api.send(:generate_sig).should == "0ff3ae460b0f7d821482204ca70c8fe8"
      end
    end
  
    describe 'GET the response from the API' do
      before do
        Rovi::Api.expects(:get).with('http://api.rovicorp.com/data/v1/album/info', { 
        :query => { :albumid => 'MW0000111184', :apikey => '12345', 
        :sig => '0ff3ae460b0f7d821482204ca70c8fe8'}})

        Timecop.freeze(Time.local(2012, 1, 1)) do
          @response = @api.get("album", "info", { :albumid => "MW0000111184" })
        end
      end
      
    end
  end
end