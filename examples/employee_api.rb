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

# new_employees = KeyPay::Employee.new(KEY["api_key"],
# 																		{:business_id => businesses_ids.first,
# 																		 :status => 'Active',
# 																		 :tax_file_number => '375843760',
# 																		 :title => 'Mr',
# 																		 :first_name => 'Ramesh',
# 																		 :surname => 'Holliday',
# 																		 :date_of_birth => '1992-07-12T00:00:00',
# 																		 :external_id => 'MAN000',
# 																		 :residential_street_address => '16/400 Sydney Road',
# 																		 :start_date => '2012-07-02T00:00:00',
# 																		 :rate_unit => 'Hourly',
# 																		 :job_title => 'Worker'})
# pp "**** Post New Employee Result"
# new_employee = new_employees.create
# new_employee
# pp "**** Get New Employee"
# employee = KeyPay::Employee.get_by_id(KEY["api_key"], businesses_ids.first, new_employee["id"])
# pp employee

pp "**** PUT Employee Detail"
new_info = KeyPay::Employee.new(KEY["api_key"],
															 { :business_id => businesses_ids.first,
															 	 :id => employees.last,
																 :status => 'Terminated',
																 :title => 'Mr',
																 :first_name => 'Ramesh',
																 :surname => 'Annesh',
																 :date_of_birth => '1990-07-12T00:00:00',
																 :external_id => 'MAN111',
																 :residential_street_address => '16/500 Sydney Road'})
employee = employees.last
updated_employee = employee.update
pp "**** Status from #{employee.status} to #{updated_employee.status}"
pp "**** Surname from #{employee.surname} to #{updated_employee.surname}"
pp "**** Date Of Birth from #{employee.date_of_birth} to #{updated_employee.date_of_birth}"
pp "**** Street Address from #{employee.residential_street_address} to #{updated_employee.residential_street_address}"

