class MyDevise::RegistrationsController < Devise::RegistrationsController

  def new
    @token = params[:invite_token]
    super
  end

  def create
    @token = params[:invite_token]
    if @token != nil
      @newUser = build_resource(user_params)
      @newUser.save
      pg = Invite.find_by_token(@token).page_id
      Connection.create(page_id: pg, editor_id: @newUser.id)
    else
      super
    end

  end

  private
  def user_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

end