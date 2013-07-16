module KeyPay
  class Business < API
    
    attr_accessor :operation
    
    def initialize(api_key=nil, options={})
      @operation = "business"
      super(api_key, options)
    end
    
    def all
      get(operation)
    end
  end
end

