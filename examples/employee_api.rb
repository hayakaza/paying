require 'rubygems'
require 'pp'
require 'yaml'

require File.dirname(__FILE__) + '/../lib/key_pay.rb'

KEY = YAML.load_file(File.dirname(__FILE__) + '/keypay_keys.yml')

# Example Business API Call
employees = KeyPay::Employee.all(KEY["api_key"], 32)
pp "**** Get All Employees API by Business ID"
pp employees