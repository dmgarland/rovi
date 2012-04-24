module Rovi
  module Services
    class Recommendations < Rovi::Api
      
      def initialize(api_key, api_secret)
        super(api_key, api_secret)
        @service_name = "recs"
        @version = "v2"
      end
      
    end    
  end
end
