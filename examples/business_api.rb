require 'rubygems'
require 'pp'
require 'yaml'

require File.dirname(__FILE__) + '/../lib/key_pay.rb'

KEY = YAML.load_file(File.dirname(__FILE__) + '/keypay_keys.yml')

# Example Business API Call
businesses = KeyPay::Business.all(KEY["api_key"])
pp "**** Get All Business API"
pp businesses

business_id = KeyPay::Business.get_by_id(KEY["api_key"], businesses.first.id)
pp "**** Get Business By ID API"
pp business_id

business_external_id = KeyPay::Business.get_by_external_id(KEY["api_key"], businesses.first.external_id)
pp "**** Get Business By External ID API"
pp business_external_id

new_business = KeyPay::Business.new(KEY["api_key"], {:id => 116,
:name => "My Business", 
:abn => 24133952824, 
:legal_name => "Employment Innovations Pty Ltd2", 
:contact_name => "Business Conatact", 
:contact_email_address => "my@business.com", 
:contact_phone_number => "123456", 
:external_id => "TGE", 
:standard_hours_per_day => 9})
pp "**** POST Business API"
pp new_business.create

latest_businesses = KeyPay::Business.all(KEY["api_key"])
pp "**** Latest Businesses"
pp latest_businesses