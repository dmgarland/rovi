module Rovi
  module Services
    class Search < Rovi::Api
      
      def initialize(api_key, api_secret)
        super(api_key, api_secret)
        @service_name = "search"
        @version = "v2"
      end
      
    end    
  end
end
