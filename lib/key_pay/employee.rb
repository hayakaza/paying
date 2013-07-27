module KeyPay
  class Employee < API
    OPERATION = "business"
   
    JSON_ATTRIBUTES = { "taxFileNumber"                             => "tax_file_number",
    										"status"                                    => "status",
            						"title"               		                  => "title",
            						"firstName"               					        => "first_name",
            						"surname"               					          => "surname",
            						"dateOfBirth"                               => "date_of_birth",
            						"externalId"               					        => "external_id",
            						"residentialStreetAddress"          		    => "residential_street_address",
            						"residentialSuburb"               			    => "residential_suburb",
            						"residentialState"               			      => "residential_state",
            						"residentialPostCode"               		    => "residential_post_code",
            						"postalStreetAddress"               		    => "postal_street_address",
            						"postalSuburb"                      		    => "postal_suburb",
            						"postalState"               				        => "postal_state",
            						"postalPostCode"               				      => "postal_post_code",
            						"emailAddress"                             	=> "email_address",
            						"homePhone"                                	=> "home_phone",
            						"workPhone"                                	=> "work_phone",
            						"mobilePhone"                              	=> "mobile_phone",
            						"jobTitle"                           		    => "job_title",
            						"isExemptFromPayrollTax"             		    => "is_exempt_from_payroll_tax",
            						"employingEntityABN"                 		    => "employing_entity_ABN",
            						"startDate"                                	=> "start_date",
            						"endDate"                                  	=> "end_date",
            						"employmentType"                     		    => "employment_type",
            						"australianResident"                       	=> "australian_resident",
            						"claimTaxFreeThreshold"                     => "claim_tax_free_threshold",
            						"seniorsTaxOffset"                          => "seniors_tax_offset",
            						"otherTaxOffset"                            => "other_tax_offset",
            						"helpDebt"                                  => "help_debt",
            						"afsDebt"      						                  => "afs_debt",
            						"isExemptFromFloodLevy"                     => "is_exempt_from_flood_levy",
            						"taxVariation"                              => "tax_variation",
            						"paySchedule"                               => "pay_schedule",
            						"primaryPayCategory"                        => "primary_pay_category",
            						"primaryLocation"                           => "primary_location",
            						"paySlipNotificationType"                   => "pay_slip_notification_type",
            						"rate"                                      => "rate",
            						"rateUnit"                                  => "rate_unit",
            						"locations"                                 => "locations",
            						"hoursPerWeek"                              => "hours_per_week",
            						"emergencyContact1_Name"                    => "emergency_contact1_name",
            						"emergencyContact1_Relationship"            => "emergency_contact1_relationship",
            						"emergencyContact1_Address"                 => "emergency_contact1_address",
            						"emergencyContact1_ContactNumber"           => "emergency_contact1_contact_number",
            						"emergencyContact1_AlternateContactNumber"  => "emergency_contact1_alternate_contact_number",
            						"emergencyContact2_Name"                    => "emergency_contact2_name",
            						"emergencyContact2_Relationship"            => "emergency_contact2_relationship",
            						"emergencyContact2_Address"                 => "emergency_contact2_address",
            						"emergencyContact2_ContactNumber"           => "emergency_contact2_contact_number",
            						"emergencyContact2_AlternateContactNumber"  => "emergency_contact2_alternate_contact_number",
            						"bankAccount1_BSB"                          => "bank_account1_BSB",
            						"bankAccount1_AccountNumber"                => "bank_account1_account_number",
            						"bankAccount1_AccountName"                  => "bank_account1_account_name",
            						"bankAccount1_AllocatedPercentage"          => "bank_account1_allocated_percentage",
            						"bankAccount1_FixedAmount"                  => "bank_account1_fixed_amount",
            						"bankAccount2_BSB"                          => "bank_account2_BSB",
            						"bankAccount2_AccountNumber"                => "bank_account2_account_number",
            						"bankAccount2_AccountName"                  => "bank_account2_account_name",
            						"bankAccount2_AllocatedPercentage"          => "bank_account2_allocated_percentage",
            						"bankAccount2_FixedAmount"                  => "bank_account2_fixed_amount",
            						"bankAccount3_BSB"                          => "bank_account3_BSB",
            						"bankAccount3_AccountNumber"                => "bank_account3_account_number",
            						"bankAccount3_AccountName"                  => "bank_account3_account_name",
            						"bankAccount3_AllocatedPercentage"          => "bank_account3_allocated_percentage",
            						"bankAccount3_FixedAmount"                  => "bank_account3_fixed_amount",
            						"superFund1_FundName"                       => "super_fund1_fund_name",
            						"superFund1_MemberNumber"                   => "super_fund1_member_number",
            						"superFund1_AllocatedPercentage"            => "super_fund1_allocated_percentage",
            						"superFund1_FixedAmount"                    => "super_fund1_fixed_amount",
            						"superFund2_FundName"                       => "super_fund2_fund_name",
            						"superFund2_MemberNumber"                   => "super_fund2_member_number",
            						"superFund2_AllocatedPercentage"            => "super_fund2_allocated_percentage",
            						"superFund2_FixedAmount"                    => "super_fund2_fixed_amount",
            						"superFund3_FundName"                       => "super_fund3_fund_name",
            						"superFund3_MemberNumber"                   => "super_fund3_member_number",
            						"superFund3_AllocatedPercentage"            => "super_fund3_allocated_percentage",
            						"superFund3_FixedAmount"                    => "super_fund3_fixed_amount",
            						"employee_Leave_Template"                   => "employee_leave_template",
						            "employee_PayRate_Template"                 => "employee_pay_rate_template",
						            "date_TaxFileDeclaration_Signed"            => "date_tax_file_declaration_signed",
						            "date_TaxFileDeclaration_Reported"          => "date_tax_file_declaration_reported"}
    
    attr_accessor :id, :status, :tax_file_number, :title, :first_name, :surname, :date_of_birth, :external_id, :residential_street_address, 
                  :residential_suburb, :residential_state, :residential_post_code, :postal_street_address, :postal_suburb, :postal_state, 
                  :postal_post_code, :email_address, :home_phone, :work_phone, :mobile_phone, :job_title, :is_exempt_from_payroll_tax, :employing_entity_ABN, 
                  :start_date, :end_date, :employment_type, :australian_resident, :claim_tax_free_threshold, :seniors_tax_offset, :other_tax_offset, :help_debt, 
                  :afs_debt, :is_exempt_from_flood_levy, :tax_variation, :pay_schedule, :primary_pay_category, :primary_location, :pay_slip_notification_type, 
                  :rate, :rate_unit, :locations, :emergency_contact1_name, :emergency_contact1_relationship, :emergency_contact1_address, :emergency_contact1_contact_number, 
                  :emergency_contact1_alternate_contact_number, :emergency_contact2_name, :emergency_contact2_relationship, :emergency_contact2_address, 
                  :emergency_contact2_contact_number, :emergency_contact2_alternate_contact_number, :bank_account1_BSB, :bank_account1_account_number, 
                  :bank_account1_account_name, :bank_account1_allocated_percentage, :bank_account1_fixed_amount, :bank_account2_BSB, :bank_account2_account_number, 
                  :bank_account2_account_name, :bank_account2_allocated_percentage, :bank_account2_fixed_amount, :bank_account3_BSB, :bank_account3_account_number, 
                  :bank_account3_account_name, :bank_account3_allocated_percentage, :bank_account3_fixed_amount, :super_fund1_fund_name, :super_fund1_member_number, 
                  :super_fund1_allocated_percentage, :super_fund1_fixed_amount, :super_fund2_fund_name, :super_fund2_member_number, :super_fund2_allocated_percentage, 
                  :super_fund2_fixed_amount, :super_fund3_fund_name, :super_fund3_member_number, :super_fund3_allocated_percentage, :super_fund3_fixed_amount, 
                  :employee_leave_template, :employee_pay_rate_template, :hours_per_week, :date_tax_file_declaration_reported, :date_tax_file_declaration_signed, :business_id



    def initialize(api_key=nil, params={})
      params.each do |k,v|
        self.send("#{JSON_ATTRIBUTES[k] || k}=", v)
      end

      super(api_key)
    end

    def self.all(api_key, business_id)
      API.new(api_key).get(OPERATION, :path => self.basic_path(business_id)).map{|employee| self.new(api_key, employee.merge(:business_id => business_id))}
    end

     def self.get_by_id(api_key, business_id, employee_id)
       raise StandardError.new("EmployeeID can't be blank!").message unless employee_id
       self.new(api_key, API.new(api_key).get(OPERATION, {:path => "#{self.basic_path(business_id)}/#{employee_id}"}).merge(:business_id => business_id))
     end

     def self.get_by_external_id(api_key, business_id, external_id)
       raise StandardError.new("ExternalID can't be blank!").message unless external_id
       
       result = API.new(api_key).get(OPERATION, {:path => self.basic_path(business_id), :query => "externalid=#{external_id}"})
       
       (result.is_a?Hash) ? self.new(api_key, result.merge(:business_id => business_id)) : nil
     end
     
     def self.basic_path(business_id)
       "#{business_id}/employee/unstructured"
     end 

     def create
       raise StandardError.new("BusinessID can't be blank!").message unless self.business_id
       
       result = API.new(api_key).post(OPERATION, construct_json_attributes, {:path => self.class.basic_path(business_id)})
          
       self.id = result["id"] if result["status"].downcase == "complete"
       self   
     end
     
     def update
       raise StandardError.new("BusinessID can't be blank!").message unless self.business_id      
       
       result = API.new(api_key).post(OPERATION, construct_json_attributes, {:path => "#{self.class.basic_path(business_id)}/#{self.id}"})
       
       result["status"].downcase == "complete"
     end 

    def ==(other) [ :id, :status, :tax_file_number, :title, :first_name, :surname, :date_of_birth, :external_id, :residential_street_address, 
	                  :residential_suburb, :residential_state, :residential_post_code, :postal_street_address, :postal_suburb, :postal_state, 
	                  :postal_post_code, :email_address, :home_phone, :work_phone, :mobile_phone, :job_title, :is_exempt_from_payroll_tax, :employing_entity_ABN, 
	                  :start_date, :end_date, :employment_type, :australian_resident, :claim_tax_free_threshold, :seniors_tax_offset, :other_tax_offset, :help_debt, 
	                  :afs_debt, :is_exempt_from_flood_levy, :tax_variation, :pay_schedule, :primary_pay_category, :primary_location, :pay_slip_notification_type, 
	                  :rate, :rate_unit, :locations, :emergency_contact1_name, :emergency_contact1_relationship, :emergency_contact1_address, :emergency_contact1_contact_number, 
	                  :emergency_contact1_alternate_contact_number, :emergency_contact2_name, :emergency_contact2_relationship, :emergency_contact2_address, 
	                  :emergency_contact2_contact_number, :emergency_contact2_alternate_contact_number, :bank_account1_BSB, :bank_account1_account_number, 
	                  :bank_account1_account_name, :bank_account1_allocated_percentage, :bank_account1_fixed_amount, :bank_account2_BSB, :bank_account2_account_number, 
	                  :bank_account2_account_name, :bank_account2_allocated_percentage, :bank_account2_fixed_amount, :bank_account3_BSB, :bank_account3_account_number, 
	                  :bank_account3_account_name, :bank_account3_allocated_percentage, :bank_account3_fixed_amount, :super_fund1_fund_name, :super_fund1_member_number, 
	                  :super_fund1_allocated_percentage, :super_fund1_fixed_amount, :super_fund2_fund_name, :super_fund2_member_number, :super_fund2_allocated_percentage, 
	                  :super_fund2_fixed_amount, :super_fund3_fund_name, :super_fund3_member_number, :super_fund3_allocated_percentage, :super_fund3_fixed_amount, 
	                  :employee_leave_template, :employee_pay_rate_template, :hours_per_week, :date_tax_file_declaration_reported, :date_tax_file_declaration_signed ].each do |field|
        return false if send(field) != other.send(field)
      end
      return true
    end
    
    def construct_json_attributes
      attributes = {}
      JSON_ATTRIBUTES.each{|key, value| attributes[key] = self.send(value)}
      attributes
    end
  end
end
