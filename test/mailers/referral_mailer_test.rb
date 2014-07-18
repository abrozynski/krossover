require 'test_helper'

class ReferralMailerTest < ActionMailer::TestCase
  test "referral_confirmation" do
    mail = ReferralMailer.referral_confirmation
    assert_equal "Referral confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
