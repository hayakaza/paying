require File.dirname(__FILE__) + '/../test_helper'

class UpdateEmployeeTest < Test::Unit::TestCase
  include TestHelper

  def setup
    @employee = dummy_employee
    @employee.surname = SURNAME
    @employee.rate_unit = RATE_UNIT
    @employee.external_id = EXTERNAL_ID

    if STUB_KEYPAY_CALLS
      @employee.stubs(:update).with(API_KEY, ID).returns(@employee)
    end
  end

  context "test_get_employee" do
    should "not be nil" do
      assert !@employee.nil?
    end

    should "handle the external ID" do
      assert_equal @employee.external_id, EXTERNAL_ID
    end

    should "handle the surname" do
      assert_equal @employee.surname, SURNAME
    end

    should "handle the contact rate unit" do
      assert_equal @employee.rate_unit, RATE_UNIT
    end
  end
end
