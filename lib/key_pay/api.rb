module KeyPay
  class API
  
    attr_accessor :api_key, :timeout, :api_url
   
    def initialize(api_key=nil, options={})
      @api_key = api_key
      @api_url = options[:api_url] || "https://api.yourpayroll.com.au"
    end
   
    def get(operation, options={})
      request("get", operation, options)
    end

    def post(operation, params, options={})
      params = {:params => params}
      params = params.merge(options) if options
      request("post", operation, params)
    end

    def put(operation, params, options={})
      params = {:params => params}
      params = params.merge(options) if options
      request("put", operation, params)
    end
    
    def delete(operation, options={})
      request("delete", operation, options)
    end 

    private
    
    def request(method, operation, options={})
      uri = URI.parse(api_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      full_api_path = "/api/v2/#{operation}"
      full_api_path += "/#{options[:path]}" if options[:path]
      full_api_path += "?#{options[:query]}" if options[:query]

      request = case method
        when "get"
          Net::HTTP::Get.new(full_api_path)
        when "post"
          Net::HTTP::Post.new(full_api_path, initheader = {'Content-Type' =>'application/json'})
        when "put"
          Net::HTTP::Put.new(full_api_path, initheader = {'Content-Type' =>'application/json'})
        when "delete"   
          Net::HTTP::Delete.new(full_api_path)
      end

      request.body = options[:params].to_json if options[:params]
      request.basic_auth(api_key,"")
      response = http.request(request)
                   
      if response.code.to_i == 200 || response.code.to_i == 201
        JSON.parse(response.body) rescue {"status" => "complete"}
      else
        raise StandardError.new(response.body).message
      end
    end
  end
end
