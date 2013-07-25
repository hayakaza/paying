require 'rubygems'
require 'pp'
require 'yaml'

require File.dirname(__FILE__) + '/../lib/key_pay.rb'

KEY = YAML.load_file(File.dirname(__FILE__) + '/keypay_keys.yml')

# Example Business API Call
employees = KeyPay::Employee.all(KEY["api_key"], 32)
pp "**** Get All Employees API by Business ID"
pp employees

employee_by_id = KeyPay::Employee.get_by_id(KEY["api_key"], 32, employees.first.id)
pp "**** Get Employee by EmployeeID"
pp employee_by_id

employee_by_external_id = KeyPay::Employee.get_by_external_id(KEY["api_key"], 32, employees.first.external_id)
pp "**** Get Employee by EmployeeID"
pp employee_by_external_id
