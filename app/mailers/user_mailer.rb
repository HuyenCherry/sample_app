class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, t("activation_account")
  end

  def password_reset user
    @user = user
    mail to: user.email, t("reset_password")
  end
end
