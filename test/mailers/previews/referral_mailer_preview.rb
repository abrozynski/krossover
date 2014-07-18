# Preview all emails at http://localhost:3000/rails/mailers/referral_mailer
class ReferralMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/referral_mailer/referral_confirmation
  def referral_confirmation
    ReferralMailer.referral_confirmation
  end

end
