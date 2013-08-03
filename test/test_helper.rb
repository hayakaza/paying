require "rubygems"

require 'test/unit'
require 'mocha/setup'
require 'shoulda'

require File.dirname(__FILE__) + '/../lib/key_pay.rb' unless defined?(KeyPay)

module TestHelper
  STUB_KEYPAY_CALLS = ENV["STUB_KEYPAY_CALLS"].nil? ? true : (ENV["STUB_KEYPAY_CALLS"] == "true") unless defined? STUB_KEYPAY_CALLS

  API_KEY = ENV["API_KEY"] || "fake_key" unless defined?(API_KEY)
  ID = 'fake_id'
  BUSINESS_ID = 'fake_business_id'
  SURNAME = 'Holly'
  RATE_UNIT = 'Weekly'
  EXTERNAL_ID = '2213'
  LOCATION_NAME = "Loc Name"
  SOURCE = "None"
  # Helper constant for checking regex
  GUID_REGEX = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/ unless defined?(GUID_REGEX)
 
  def dummy_businesses
    businesses = []
    3.times.each do |i|
      businesses << KeyPay::Business.new(API_KEY,
        :name => "My Business #{1+i}",
        :abn => 24133952824,
        :legal_name => "Employment Innovations Pty Ltd #{1+i}",
        :contact_name => "Business Contact #{1+i}",
        :contact_email_address => "my@business.com",
        :contact_phone_number => "123456",
        :external_id => "TGE",
        :standard_hours_per_day => 9
      )
    end
    businesses
  end

  def dummy_business
    KeyPay::Business.new(API_KEY,
      :name => "My Business #{Time.now.to_i}",
      :abn => 24133952824,
      :legal_name => "Employment Innovations Pty Ltd #{Time.now.to_i}",
      :contact_name => "Business Contact #{Time.now.to_i}",
      :contact_email_address => "my@business.com",
      :contact_phone_number => "123456",
      :external_id => "TGE",
      :standard_hours_per_day => 9
    )
  end

  def dummy_employees
    employees = []
    3.times.each do |i|
      employees << KeyPay::Employee.new(API_KEY,
                                        {:business_id => BUSINESS_ID,
                                         :status => 'Active',
                                         :tax_file_number => i+1,
                                         :title => 'Mr',
                                         :first_name => 'Holly',
                                         :surname => 'Holliday',
                                         :date_of_birth => '1992-07-12T00:00:00',
                                         :external_id => "MAN000#{i+1}",
                                         :residential_street_address => "1#{i}/400 Sydney Road",
                                         :start_date => '2012-07-02T00:00:00',
                                         :rate_unit => 'Hourly',
                                         :job_title => 'Worker'})
    end
    employees
  end

  def dummy_employee
    KeyPay::Employee.new(API_KEY,
                        {:business_id => BUSINESS_ID,
                         :status => 'Active',
                         :tax_file_number => "1112223334",
                         :title => 'Mr',
                         :first_name => 'Holly',
                         :surname => 'Holliday',
                         :date_of_birth => '1992-07-12T00:00:00',
                         :external_id => "MAN0001",
                         :residential_street_address => "11/400 Sydney Road",
                         :start_date => '2012-07-02T00:00:00',
                         :rate_unit => 'Hourly',
                         :job_title => 'Worker'})
  end
  
  def dummy_locations
    locations =[]
    3.times.each do |i|
      locations << KeyPay::Location.new(API_KEY,
                        {:id => i+1,
                         :business_id => BUSINESS_ID,
                         :external_id => "LOC#{i+1}",
                         :name => "Heart Town M12#{i+1}",
                         :state => "ACT",
                         :source => "None",
                         :fully_qualified_name => "Heart Town M12#{i+1}",
                         :parent_id => 10                        
                        })
    end 
    locations
  end 
  
  def dummy_location
    KeyPay::Location.new(API_KEY,
                        {:id => 600,
                         :business_id => BUSINESS_ID,
                         :external_id => "LOC09",
                         :name => "Heart Town M128",
                         :state => "ACT",
                         :source => "None"                          
                        })
  end 
  
  def dummy_payruns
    payruns =[]
    3.times.each do |i|
      payruns << KeyPay::Payrun.new(API_KEY,
                        {:id => i+1,
                         :date_finalised    =>  Time.now.to_s, 
                         :pay_schedule_id   =>  890, 
                         :pay_period_starting   =>  Time.now.to_s, 
                         :pay_period_ending     =>  Time.now.to_s, 
                         :date_paid             =>  Time.now.to_s, 
                         :is_finalised          =>  false 
                        })
    end 
    payruns
  end 

  def dummy_payslips 
    payslips =[]
    3.times.each do |i|
      payslips << KeyPay::Payslip.new(API_KEY,
                        {:abn => "24133952824",
                         :accrued_leave => [],
                         :bank_payments => [{:account_name => "A Test",
                                            :account_number => "410171697",
                                            :amount => 345.98,
                                            :bsb => "112879"}],
                         :base_rate => "Base Pay Rate: $20.62 Per Hour",
                         :business_id => 31,
                         :business_name => "Business Name Ltd",
                         :deductions => [],
                         :earnings_lines => [{:gross_earnings => 129.624,
                                              :is_fixed => false,
                                              :is_tax_exempt => false,
                                             :notes => "27/07/2013 - 18:00 to 00:35",
                                             :pay_category_name => "F&B 20yrs (BP1 SAT)",
                                             :rate => 21.604,
                                             :super_contribution => 11.99022,
                                             :taxable_earnings => 129.624,
                                             :units => 6.0}],
                         :employee_id => 0000,
                         :employee_name => "AA Test",                    
                         :employee_postal_street_address => "5 Ogilvy Rd",
                         :employee_postal_suburbState => "NSW",
                         :employee_postal_suburb_name => "CLONTARF",
                         :employee_postal_suburb_postcode => "2093",
                         :gross_earnings => 345.98,
                         :gross_ytd => 967.47,
                         :gross_ytd_details => [{:gross_earnings => 349.98024,
                                                 :pay_category_name => "F&B 20yrs (BP1 SAT)"}],

                         :hourly_rate   => 0.0,
                         :net_earnings  => 345.98,
                         :net_ytd       => 967.47,
                         :pay_period_ending => "28/07/2013",
                         :pay_period_starting => "22/07/2013",
                         :payg_withholding_amount => 0.0,
                         :payg_ytd => 0.0,
                         :payrun_id => 4319,
                         :post_tax_deduction_amount => 0.0,
                         :post_tax_deductions_ytd => 0.0,
                         :pre_tax_deduction_amount => 0.0,
                         :pre_tax_deductions_ytd  => 0.0,
                         :sfss_amount     => 0.0,
                         :sfss_ytd        => 0.0,
                         :super_adjustments => [],
                         :super_contribution => 32.0,
                         :super_payments => [{ :amount => 32.0,
                                               :fund_name => "REST Personal",
                                               :member_number => "710425185"}],
                         :super_ytd => 89.49,
                         :taxable_earnings => 345.98,
                         :taxable_earnings_ytd => 967.47,
                         :total_accrued_leave => [],
                         :total_hours => 15.18
                        })
    end 
    payslips
  end 
end
