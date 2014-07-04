 class MyDevise::PasswordsController < Devise::RegistrationsController

  def update
    @user = User.find_by_email(@invite.email)
    @user.password = User.reset_password_token
    @user.reset_password_token = User.reset_password_token
    @user.email = @invite.email
  end

end