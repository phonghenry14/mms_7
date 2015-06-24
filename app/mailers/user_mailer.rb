class UserMailer < ApplicationMailer
  def mail_create_user user
    @name = user.name
    @email = user.email
    @password = user.password
    mail to: user.email, subject: t("layouts.title")
  end
end
