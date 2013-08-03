require File.dirname(__FILE__) + '/../test_helper'

class GetPaysrunsTest < Test::Unit::TestCase
  include TestHelper
  
  def setup
    @keypay = KeyPay::Payrun

    if STUB_KEYPAY_CALLS
      KeyPay::Payrun.stubs(:all).with(API_KEY, ID).returns(dummy_payruns)
    end
    @result = KeyPay::Payrun.all(API_KEY, ID)
    @payrun = dummy_payruns.last
  end
  
  context "test_get_payruns" do
    should "not be nil" do
      assert !@result.nil?
      assert_equal @result.size, 3
    end

    should "handle the payrun dateFinalised" do
      assert_equal @result.last.date_finalised, @payrun.date_finalised
    end

    should "handle the payrun payScheduleId" do
      assert_equal @result.last.pay_schedule_id, @payrun.pay_schedule_id
    end

    should "handle the payrun payPeriodStarting" do
      assert_equal @result.last.pay_period_starting, @payrun.pay_period_starting
    end

    should "handle the payrun payPeriodEnding" do
      assert_equal @result.last.pay_period_ending, @payrun.pay_period_ending
    end

    should "handle the payrun datePaid" do
      assert_equal @result.last.date_paid, @payrun.date_paid
    end

    should "handle the payrun isFinalised" do
      assert_equal @result.last.is_finalised, @payrun.is_finalised
    end
  end
end
