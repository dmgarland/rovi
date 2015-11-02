module Rovi
  module Services
    class Song < Rovi::Api
      
      def initialize(api_key, api_secret)
        super(api_key, api_secret)
        @service_name = "data"
        @version = "v1.1"
      end


      
    end    
  end
end
