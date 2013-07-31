module KeyPay
  class Location < API
    OPERATION = "business"
    
    JSON_ATTRIBUTES = {
      "name"                => "name",
      "parentId"            => "parent_id",
      "state"               => "state",
      "externalId"          => "external_id",
      "source"              => "source",
      "fullyQualifiedName"  => "fully_qualified_name",
      "nestedLocations"     => "nested_locations"
    }
    
    VALID_STATES = [ "ACT", "NSW", "NT", "QLD", "SA", "TAS", "VIC", "WA"]
    
    attr_accessor :id, :name, :parent_id, :state, :external_id, :source, :fully_qualified_name, :business_id, :nested_locations
    
    def initialize(api_key=nil, params={})
      params["nestedLocations"] = self.construct_nested_locations(params["nestedLocations"], params[:business_id]) if params["nestedLocations"]

      params.each do |k,v|
        self.send("#{JSON_ATTRIBUTES[k] || k}=", v)
      end

      super(api_key)
    end
    
    def construct_nested_locations(locations, business_id)
      locations.each do |location|
        Location.new(location.merge(:business_id => business_id))
      end 
    end 
    
    def self.all(api_key, business_id)
      API.new(api_key).get(OPERATION, :path => self.basic_path(business_id)).map{|employee| self.new(api_key, employee.merge(:business_id => business_id))}
    end
    
    def self.get_by_id(api_key, business_id, location_id)
       raise StandardError.new("LocationID can't be blank!").message unless location_id
       self.new(api_key, API.new(api_key).get(OPERATION, {:path => "#{self.basic_path(business_id)}/#{location_id}"}).merge(:business_id => business_id))
     end
    
    def self.basic_path(business_id)
      "#{business_id}/location"
    end 
    
    def save
      self.id ? update : create
    end 
    
    def create
      raise StandardError.new("BusinessID can't be blank!").message unless self.business_id
      
      result = API.new(api_key).post(OPERATION, construct_json_attributes, {:path => self.class.basic_path(business_id)})

      self.id = result["id"] if result["id"]
      self
    end 
    
    def update
      raise StandardError.new("BusinessID can't be blank!").message unless self.business_id      
      
      result = API.new(api_key).put(OPERATION, construct_json_attributes, {:path => "#{self.class.basic_path(business_id)}/#{self.id}"})
       
      result["status"].downcase == "complete"
    end    
    
    def delete
      raise StandardError.new("BusinessID can't be blank!").message unless self.business_id      
      
      result = API.new(api_key).delete(OPERATION, {:path => "#{self.class.basic_path(business_id)}/#{self.id}"})
            
      result["status"].downcase == "complete"
    end 
    
    def ==(other)
      [:id, :name, :parent_id, :state, :external_id, :source, :fully_qualified_name, :business_id, :nested_locations].each do |field|
        return false if send(field) != other.send(field)
      end 
      
      return true
    end 
    
    def construct_json_attributes
      attributes = {}
      JSON_ATTRIBUTES.each{|key, value| attributes[key] = self.send(value)}
      attributes.delete("nestedLocations")
      attributes
    end
  end
end
