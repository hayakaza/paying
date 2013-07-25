module KeyPay
  class ApiException < StandardError
    
    def initialize(response, method, operation, options={})
      @response = response
      @method = method
      @operation = operation
      @options = options  
    end
       
    def message
      if @method == "get"
        RecordNotFound.new(@operation, @options[:api])
      else
        @response 
      end 
    end
    
  end
  
  class RecordNotFound < StandardError    
    def initialize(record_type, record_id)
      @record_type = record_type
      @record_id   = record_id
    end
    
    def message
      "Couldn't find #{@record_type} for record ID = #{@record_id}"
    end
    
  end
end 
