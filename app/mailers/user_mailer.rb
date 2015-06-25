class UserMailer < ApplicationMailer
  default from: "duongnv.hedspi@gmail.com"

  def update_team_email user
    @user = user
    mail to: @user.email,
         from: "duongnv.hedspi@gmail.com",
         subject: t("mail.subject")
  end
end
