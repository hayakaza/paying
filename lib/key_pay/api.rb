module KeyPay
  class API
  
    attr_accessor :api_key, :timeout, :api_url
   
    def initialize(api_key=nil, options={})
      @api_key = api_key
      @api_url = options[:api_url] || "https://api.yourpayroll.com.au"
    end
   
    def get(operation) 
      request("get", operation)
    end
    
    private
    
    def request(method, operation)
      uri = URI.parse(api_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      
      request = case method
        when "get"
          Net::HTTP::Get.new("/api/v2/#{operation}")
        when "post"
          Net::HTTP::Post.new("/api/v2/#{operation}")        
      end
      
      request.basic_auth(api_key,"")
      response = http.request(request)
      JSON.parse(response.body)
    end
  end
end
