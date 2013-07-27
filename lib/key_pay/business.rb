module KeyPay
  class Business < API
    OPERATION = "business"

    JSON_ATTRIBUTES = {"name"                       => "name",
                       "abn"                        => "abn",
                       "legalName"                  => "legal_name",
                       "contactName"                => "contact_name",
                       "contactEmailAddress"        => "contact_email_address",
                       "contactPhoneNumber"         => "contact_phone_number",
                       "externalId"                 => "external_id",
                       "standardHoursPerDay"        => "standard_hours_per_day",
                       "integratedTimesheetsEnabled"=> "integrated_timesheets_enabled"
                       }

    attr_accessor :id, :name, :abn, :legal_name, :contact_name, :contact_email_address, :contact_phone_number, :external_id, :standard_hours_per_day, :integrated_timesheets_enabled

    def initialize(api_key=nil, params={})
      params.each do |k,v|
        self.send("#{JSON_ATTRIBUTES[k] || k}=", v)
      end

      super(api_key)
    end

    def self.all(api_key)
      API.new(api_key).get(OPERATION).map{|business| self.new(api_key,business)}
    end

    def self.get_by_id(api_key,id)
      self.new(api_key, API.new(api_key).get(OPERATION, {:path => id}))
    end

    def self.get_by_external_id(api_key, id)
      self.new(api_key, API.new(api_key).get(OPERATION, {:query => "externalId=#{id}"}))
    end

    def create
      API.new(api_key).post(OPERATION, construct_json_attributes)
    end

    def ==(other) [ :id, :name, :abn, :legal_name, :contact_name, :contact_email_address, :contact_phone_number, :external_id, :standard_hours_per_day, :integrated_timesheets_enabled ].each do |field|
        return false if send(field) != other.send(field)
      end
      return true
    end

    def construct_json_attributes
      attributes = {}
      JSON_ATTRIBUTES.each{|key, value| attributes[key] = self.send(value)}
      attributes
    end
  end
end
