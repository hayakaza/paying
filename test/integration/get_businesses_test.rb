require File.dirname(__FILE__) + '/../test_helper'

class BusinessListTest < Test::Unit::TestCase
  include TestHelper

  def setup
    # @keypay = KeyPay::API.new(API_KEY, :api_url => 'DUMMY_URL')
    @keypay = KeyPay::Business

    if STUB_KEYPAY_CALLS
      @result = KeyPay::Business.stubs(:all).with(API_KEY).returns(dummy_business)
    end
  end

  def test_get_business
    new_business = dummy_business 
    assert !@result.nil?

    assert_equal @result.name, new_business.name
    assert_equal @result.external_id, new_business.external_id
    assert_equal @result.abn, new_business.abn
    assert_equal @result.contact_name, new_business.contact_name
    assert_equal @result.contact_email_address, new_business.contact_email_address
    assert_equal @result.contact_phone_number, new_business.contact_phone_number
  end
end
