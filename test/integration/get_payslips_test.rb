require File.dirname(__FILE__) + '/../test_helper'

class GetPayslipsTest < Test::Unit::TestCase
  include TestHelper
  
  def setup
    @keypay = KeyPay::Payslip

    if STUB_KEYPAY_CALLS
      KeyPay::Payslip.stubs(:all).with(API_KEY, ID).returns(dummy_payslips)
    end
    @result = KeyPay::Payslip.all(API_KEY, ID)
    @payslip = dummy_payslips.last
  end
  
  context "test_get_payslips" do
    should "not be nil" do
      assert !@result.nil?
      assert_equal @result.size, 3
    end

    should "handle the payslips attributes" do
      [ :business_id, :employee_id, :payrun_id, :total_hours, :gross_earnings, :net_earnings, :payg_withholding_amount, :sfss_amount, 
        :help_amount, :super_contribution, :taxable_earnings, :post_tax_deduction_amount, :pre_tax_deduction_amount, 
        :business_name, :business_address, :abn, :pay_period_starting, :pay_period_ending, :message, :employee_id, 
        :employee_name, :employee_postal_street_address, :employee_postal_address_line2, :employee_postal_suburb_name, 
        :employee_postal_suburb_postcode, :employee_postal_suburbState, :notation, :gross_ytd, :net_ytd, :payg_ytd, 
        :super_ytd, :taxable_earnings_ytd, :base_rate, :hourly_rate, :pre_tax_deductions_ytd, :post_tax_deductions_ytd, 
        :sfss_ytd, :help_ytd].each do |field|
        assert_equal @result.last.send(field), @payslip.send(field)
      end
    end

    should "handle fields contain object" do
      [:total_accrued_leave, :accrued_leave, :leave_taken, 
        :payg_adjustments, :super_adjustments, :earnings_lines, :deductions, :super_payments, :bank_payments, 
        :gross_ytd_details].each do |field|
          object_values = @result.last.send(field)
          assert_equal @result.last.send(field).first.class, @payslip.send(field).first.class if object_values && (object_values.length > 0)
      end
    end

  end  
end
