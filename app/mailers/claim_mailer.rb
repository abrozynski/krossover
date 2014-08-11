class ClaimMailer < ActionMailer::Base
  default from: "Coach@Krossover.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.referral_mailer.referral_confirmation.subject
  #
  #
  def claim_confirmation(claim)
    
    @claim = claim
    
    mail to: "jaki@krossover.com", subject: "Claim for a Reward Made On KrossoverKredit.com" 
  end
end