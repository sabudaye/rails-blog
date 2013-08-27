class UserMailer < ApplicationMailer
  def send_to_user(user)
    @user = user
    mail(to: user.email)
  end
end
