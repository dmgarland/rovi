module Rovi  
  class JsonResponse
    
    def initialize(parsed_response)
      @hash = parsed_response
    end
    
    def method_missing(m)
      key = m.to_s      
      if @hash != nil and @hash.has_key?(key)
        v = @hash[key]        
        v = JsonResponse.new(v) if v.is_a?(Hash)
        return v
      else
        super
      end
    end
    
  end  
end
