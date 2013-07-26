require File.dirname(__FILE__) + '/../test_helper'

class GetEmployeesTest < Test::Unit::TestCase
  include TestHelper

  def setup
    @keypay = KeyPay::Employee

    if STUB_KEYPAY_CALLS
      KeyPay::Employee.stubs(:all).with(API_KEY, ID).returns(dummy_employees)
    end
    @result = KeyPay::Employee.all(API_KEY, ID)
    @employee = dummy_employees.last
  end

  context "test_get_employee" do
    should "not be nil" do
      assert !@result.nil?
      assert_equal @result.size, 3
    end

    should "handle the employee Firstname" do
      assert_equal @result.last.first_name, @employee.first_name
    end

    should "handle the external ID" do
      assert_equal @result.last.external_id, @employee.external_id
    end

    should "handle the surname" do
      assert_equal @result.last.surname, @employee.surname
    end

    should "handle the date of birth" do
      assert_equal @result.last.date_of_birth, @employee.date_of_birth
    end

    should "handle the contact rate unit" do
      assert_equal @result.last.rate_unit, @employee.rate_unit
    end

    should "handle the job title" do
      assert_equal @result.last.job_title, @employee.job_title
    end
  end
end
