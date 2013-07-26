require File.dirname(__FILE__) + '/../test_helper'

class GetEmployeeTest < Test::Unit::TestCase
  include TestHelper

  def setup
    @keypay = KeyPay::Employee

    if STUB_KEYPAY_CALLS
      KeyPay::Employee.stubs(:get_by_id).with(API_KEY, ID).returns(dummy_employee)
    end
    @result = KeyPay::Employee.get_by_id(API_KEY, ID)
    @employee = dummy_employee
  end

  context "test_get_employee" do
    should "not be nil" do
      assert !@result.nil?
    end

    should "handle the employee Firstname" do
      assert_equal @result.first_name, @employee.first_name
    end

    should "handle the external ID" do
      assert_equal @result.external_id, @employee.external_id
    end

    should "handle the surname" do
      assert_equal @result.surname, @employee.surname
    end

    should "handle the date of birth" do
      assert_equal @result.date_of_birth, @employee.date_of_birth
    end

    should "handle the contact rate unit" do
      assert_equal @result.rate_unit, @employee.rate_unit
    end

    should "handle the job title" do
      assert_equal @result.job_title, @employee.job_title
    end
  end
end
