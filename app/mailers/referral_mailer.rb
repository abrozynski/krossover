class ReferralMailer < ActionMailer::Base
  default from: "Krossover.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.referral_mailer.referral_confirmation.subject
  #
  def referral_confirmation(referral)
    @referral = referral 
   

    mail to: referral.email, subject: "Coach #{referral.name}, do you want to win more games this season?"
  end
end