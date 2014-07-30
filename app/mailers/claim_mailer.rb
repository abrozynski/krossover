class ClaimMailer < ActionMailer::Base
  default from: "Coach@Krossover.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.claim_mailer.claim_confirmation.subject
  #
  def claim_confirmation(claim)
    @claim = claim
    
    mail to: "gary.spagnoli@gmail.com", 
      subject: "Coach, do you want to win more games?" #bcc: jaki@krossover.com
  
  end
end