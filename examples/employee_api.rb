require 'rubygems'
require 'pp'
require 'yaml'

require File.dirname(__FILE__) + '/../lib/key_pay.rb'

KEY = YAML.load_file(File.dirname(__FILE__) + '/keypay_keys.yml')

# Example Business API Call
businesses = KeyPay::Business.all(KEY["api_key"])
pp "**** All Business IDs"
businesses_ids = businesses.map { |business| business.id }
pp businesses_ids

# Example Business API Call
employees = KeyPay::Employee.all(KEY["api_key"], businesses_ids.first)
pp "**** Get All Employees API by Business ID"
pp employees


pp "**** All Employees IDs"
employees_ids = employees.map { |emp| emp.id }
pp employees_ids
employee_by_id = KeyPay::Employee.get_by_id(KEY["api_key"], businesses_ids.first, employees_ids.first)
pp "**** Get Employee by EmployeeID"
pp employee_by_id


pp "**** All Employees ExternalIDs"
employees_external_ids = employees.map { |emp| emp.external_id }
pp employees_external_ids

employee_by_external_id = KeyPay::Employee.get_by_external_id(KEY["api_key"], businesses_ids.first, employees_external_ids.last)
pp "**** Get Employee by ExternalID"
pp employee_by_external_id

new_employee = KeyPay::Employee.new(KEY["api_key"],
 																		{:business_id => businesses_ids.first,
 																		 :status => 'Active',
 																		 :tax_file_number => '375843760',
 																		 :title => 'Mr',
 																		 :first_name => 'Afrika',
 																		 :surname => 'Holliday',
																		 :date_of_birth => '1992-07-12T00:00:00',
 																		 :external_id => 'MAN000',
 																		 :residential_street_address => '16/400 Sydney Road',
 																		 :start_date => '2012-07-02T00:00:00',
 																		 :rate_unit => 'Hourly',
 																		 :job_title => 'Worker'})
pp "**** Post New Employee Result"
pp new_employee.create
 
pp "**** PUT Employee Detail"
pp "**** Select employee that will be updated"
updated_employee = employee = employees.last

#Specify the fields that changes
employee.surname        = "Hello"
employee.external_id = "MAN879"

pp "UPDATE STATUS = #{employee.update}"	 
updated_employee = KeyPay::Employee.get_by_id(KEY["api_key"], employee.business_id, employee.id)

pp "**** Surname from #{employee.surname} to #{updated_employee.surname}"
pp "**** Date Of Birth from #{employee.external_id} to #{updated_employee.external_id}"


