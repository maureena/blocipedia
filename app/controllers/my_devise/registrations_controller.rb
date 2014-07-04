class MyDevise::RegistrationsController < Devise::RegistrationsController

  def new
    super
    @token = params[:invite_token]
  end

  def create
    @newUser = build_resource(user_params)
    @newUser.save
    @token = params[:invite_token]
    if @token != nil
      pg = Invite.find_by_token(@token).page_id
      Connection.create(page_id: pg.id, editor_id: @newUser.id)
      @newUser.sign_in
    else
      super
    end

  end

  private
  def user_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

end