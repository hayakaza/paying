module KeyPay
  class Payrun < API
    OPERATION = "business"
    
    JSON_ATTRIBUTES = {
    "dateFinalised"        =>  "date_finalised", 
    "payScheduleId"        =>  "pay_schedule_id", 
    "payPeriodStarting"    =>  "pay_period_starting", 
    "payPeriodEnding"      =>  "pay_period_ending", 
    "datePaid"             =>  "date_paid", 
    "isFinalised"          =>  "is_finalised"
    }
    
    attr_accessor :id, :business_id, :date_finalised, :pay_schedule_id, :pay_period_starting, :pay_period_ending, :date_paid, :is_finalised
    
    def initialize(api_key=nil, params={})
      params.each do |k,v|
        self.send("#{JSON_ATTRIBUTES[k] || k}=", v)
      end

      super(api_key)
    end
    
    def self.all(api_key, business_id)
      API.new(api_key).get(OPERATION, :path => self.basic_path(business_id)).map{|payrun| self.new(api_key, payrun.merge(:business_id => business_id))}
    end
    
    def self.basic_path(business_id)
      "#{business_id}/payrun"
    end 
    
    def ==(other)
      [:id, :business_id, :date_finalised, :pay_schedule_id, :pay_period_starting, :pay_period_ending, :date_paid, :is_finalised].each do |field|
        return false if send(field) != other.send(field)
      end 
      
      return true
    end
  end
end
