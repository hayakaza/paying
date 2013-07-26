require File.dirname(__FILE__) + '/../test_helper'

class CreateGetEmployeeTest < Test::Unit::TestCase
  include TestHelper

  def setup
    @employee = dummy_employee

    if STUB_KEYPAY_CALLS
      @employee.stubs(:create).with(API_KEY, ID).returns(dummy_employee)
    end
    @dummy_employee = dummy_employee
  end

  context "test_get_employee" do
    should "not be nil" do
      assert !@dummy_employee.nil?
    end

    should "handle the employee Firstname" do
      assert_equal @dummy_employee.first_name, @employee.first_name
    end

    should "handle the external ID" do
      assert_equal @dummy_employee.external_id, @employee.external_id
    end

    should "handle the surname" do
      assert_equal @dummy_employee.surname, @employee.surname
    end

    should "handle the date of birth" do
      assert_equal @dummy_employee.date_of_birth, @employee.date_of_birth
    end

    should "handle the contact rate unit" do
      assert_equal @dummy_employee.rate_unit, @employee.rate_unit
    end

    should "handle the job title" do
      assert_equal @dummy_employee.job_title, @employee.job_title
    end
  end
end
