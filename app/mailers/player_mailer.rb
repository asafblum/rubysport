class PlayerMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.player_mailer.invitation.subject
  #

  def invitation_confirmation( invitation)
    @invitation = invitation   

    #mail to: inivitation.recipient_email , subject: "You've got invited!"
        mail to: "asafblum@gmail.com", subject: "You've got invited!"

  end
end
