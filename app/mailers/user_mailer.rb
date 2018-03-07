class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.quotes.subject
  #
  def quotes(user)
    @greeting = "Hi"

    @user = user
    @request = @user.request

    mail(to: user.email, subject: 'Your offers have arrived!')
  end
end
