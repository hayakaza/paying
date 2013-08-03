module KeyPay
  class Payslip < API
    OPERATION = "business"
    
    JSON_ATTRIBUTES = {
    "totalAccruedLeave"     =>  "total_accrued_leave", #array
    "accruedLeave"          =>  "accrued_leave", #array
    "leaveTaken"            =>  "leave_taken", #array
    "paygAdjustments"       =>  "payg_adjustments", #array
    "superAdjustments"      =>  "super_adjustments", #array
    "earningsLines"         =>  "earnings_lines", #arra
    "deductions"            =>  "deductions", #array
    "superPayments"         =>  "super_payments", #array
    "bankPayments"          =>  "bank_payments", #array
    "grossYTDDetails"       =>  "gross_ytd_details", #array
    "totalHours"            =>  "total_hours", 
    "grossEarnings"         =>  "gross_earnings", 
    "netEarnings"           =>  "net_earnings", 
    "paygWithholdingAmount" =>  "payg_withholding_amount", 
    "sfssAmount"            =>  "sfss_amount", 
    "helpAmount"            =>  "help_amount", 
    "superContribution"     =>  "super_contribution", 
    "taxableEarnings"       =>  "taxable_earnings", 
    "postTaxDeductionAmount"=>  "post_tax_deduction_amount", 
    "preTaxDeductionAmount" =>  "pre_tax_deduction_amount", 
    "businessName"          =>  "business_name", 
    "businessAddress"       =>  "business_address", 
    "abn"                   =>  "abn", 
    "payPeriodStarting"     =>  "pay_period_starting", 
    "payPeriodEnding"       =>  "pay_period_ending", 
    "message"               =>  "message", 
    "employeeId"            =>  "employee_id", 
    "employeeName"          =>  "employee_name", 
    "employeePostalStreetAddress" =>  "employee_postal_street_address", 
    "employeePostalAddressLine2"  =>  "employee_postal_address_line2", 
    "employeePostalSuburbName"    =>  "employee_postal_suburb_name", 
    "employeePostalSuburbPostcode"=>  "employee_postal_suburb_postcode", 
    "employeePostalSuburbState"   =>  "employee_postal_suburbState", 
    "notation"                    =>  "notation", 
    "grossYTD"                    =>  "gross_ytd", 
    "netYTD"                      =>  "net_ytd", 
    "paygYTD"                     =>  "payg_ytd", 
    "superYTD"                    =>  "super_ytd", 
    "taxableEarningsYTD"          =>  "taxable_earnings_ytd", 
    "baseRate"                    =>  "base_rate", 
    "hourlyRate"                  =>  "hourly_rate", 
    "preTaxDeductionsYTD"         =>  "pre_tax_deductions_ytd", 
    "postTaxDeductionsYTD"        =>  "post_tax_deductions_ytd", 
    "sfssYTD"                     =>  "sfss_ytd", 
    "helpYTD"                     =>  "help_ytd"
    }    
       
    attr_accessor :business_id, :employee_id, :payrun_id, :total_accrued_leave, :accrued_leave, :leave_taken, 
    :payg_adjustments, :super_adjustments, :earnings_lines, :deductions, :super_payments, :bank_payments, 
    :gross_ytd_details, :total_hours, :gross_earnings, :net_earnings, :payg_withholding_amount, :sfss_amount, 
    :help_amount, :super_contribution, :taxable_earnings, :post_tax_deduction_amount, :pre_tax_deduction_amount, 
    :business_name, :business_address, :abn, :pay_period_starting, :pay_period_ending, :message, :employee_id, 
    :employee_name, :employee_postal_street_address, :employee_postal_address_line2, :employee_postal_suburb_name, 
    :employee_postal_suburb_postcode, :employee_postal_suburbState, :notation, :gross_ytd, :net_ytd, :payg_ytd, 
    :super_ytd, :taxable_earnings_ytd, :base_rate, :hourly_rate, :pre_tax_deductions_ytd, :post_tax_deductions_ytd, 
    :sfss_ytd, :help_ytd
    
    def initialize(api_key=nil, params={})
      params.each do |k,v|
        attr_name = JSON_ATTRIBUTES[k] || k
        v = construct_record_collections(attr_name, v) if (v.is_a?Array) || (v.is_a?Hash)
        self.send("#{attr_name}=", v)
      end

      super(api_key)
    end
    
    def self.all(api_key, business_id, payrun_id, employee_id=nil)
      path = self.basic_path(business_id, payrun_id)
      path += "/#{employee_id}" if employee_id
      
      result = API.new(api_key).get(OPERATION, :path => path)
      parse_payslip(result, api_key, business_id, payrun_id, employee_id)
    end
    
    def self.basic_path(business_id, payrun_id)
      "#{business_id}/payrun/#{payrun_id}/payslips"
    end  
    
    private
    
    def self.parse_payslip(payslip_hash, api_key, business_id, payrun_id, employee_id)
      return self.new(api_key, payslip_hash.merge(:business_id => business_id, :payrun_id => payrun_id, :employee_id => employee_id)) if employee_id
    
      payslips = []
      payslip_hash.each do |key, value|
        payslips << self.new(api_key, value.merge(:business_id => business_id, :payrun_id => payrun_id, :employee_id => key))
      end
      
      payslips
    end
        
    def construct_record_collections(class_name, params)
      records = []
      params ||= []
      params = [params] unless params.is_a?Array
      
      return [] if params.empty?
      
      record_class = case class_name.to_sym
        when :total_accrued_leave then TotalAccruedLeave
        when :accrued_leave       then AccruedLeave
        when :leave_taken         then LeaveTaken
        when :payg_adjustments    then PaygAdjustment
        when :super_adjustments   then SuperAdjustment
        when :earnings_lines      then EarningsLine
        when :deductions          then Deduction
        when :super_payments      then SuperPayment
        when :bank_payments       then BankPayment
        when :gross_ytd_details   then GrossYTDDetail
        else PaySliDynamicClass
      end 
      
      (params).each do |param|      
        record = record_class.new
        record.add_attrs(param)
        records << record
      end
      
      records
    end 
  end
    
  class PaySliDynamicClass
    def add_attrs(attrs)
      attrs.each do |var, value|
        attr_name = var.to_s.underscore
        (class << self ; self ; end).send :attr_accessor , attr_name
        instance_variable_set "@#{attr_name}", value
      end
    end
  end
  
  class TotalAccruedLeave < PaySliDynamicClass; end
  class AccruedLeave < PaySliDynamicClass; end 
  class LeaveTaken < PaySliDynamicClass; end 
  class PaygAdjustment < PaySliDynamicClass; end 
  class SuperAdjustment < PaySliDynamicClass; end 
  class EarningsLine < PaySliDynamicClass; end 
  class Deduction < PaySliDynamicClass; end 
  class SuperPayment < PaySliDynamicClass; end 
  class BankPayment < PaySliDynamicClass; end 
  class GrossYTDDetail < PaySliDynamicClass; end 
  
end
