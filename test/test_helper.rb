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

end
