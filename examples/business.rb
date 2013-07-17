require 'rubygems'
require 'pp'
require 'yaml'

require File.dirname(__FILE__) + '/../lib/key_pay.rb'

KEY = YAML.load_file(File.dirname(__FILE__) + '/keypay_keys.yml')

#businesses = KeyPay::Business.all(KEY["api_key"])
#pp businesses

#business = KeyPay::Business.get_by_external_id(KEY["api_key"], "MAN")
#pp business.attributes
#business = KeyPay::Business.all(KEY["api_key"])

new_business = KeyPay::Business.new(KEY["api_key"], {:id => 116, 
:name => "Test Gem5", 
:abn => 24133952824, 
:legal_name => "Employment Innovations Pty Ltd2", 
:contact_name => "Gem Test", 
:contact_email_address => "test@gem", 
:contact_phone_number => "123456", 
:external_id => "TGE", 
:standard_hours_per_day => 9})

pp new_business.create
