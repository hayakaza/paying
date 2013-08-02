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

pp "**** All PayRun"
payruns = KeyPay::Payrun.all(KEY["api_key"], businesses_ids.first)
pp payruns

pp "*******GET payslip********"
payslips = KeyPay::Payslip.all(KEY["api_key"], businesses_ids.first, payruns.last.id, 2232)
pp payslips


pp "*******GET payslip by employeeId ********"
payslip = KeyPay::Payslip.all(KEY["api_key"], businesses_ids.first, payruns.last.id, 2232)
pp payslip
