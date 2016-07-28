class Signup < ActionMailer::Base
  default from: "no-reply@colcho.net"

  def confirm_email(user)
    @user = user
    @confirmation_link = confirmation_url({
      token: @user.confirmation_token
    })

    mail({
        to: user.email,
        bcc: ["sign ups <robfds@gmail.com>"],
        subject: I18n.t('signup.confirm_email.subject')
    })
  end
end
