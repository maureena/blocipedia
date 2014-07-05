class MyDevise::RegistrationsController < Devise::RegistrationsController
  after_filter :create do
    assign_editor
  end

  def new
    @token = params[:invite_token]
    super
  end

  def create
    super
   end

  def assign_editor
    @token = params[:invite_token]
    if @token != nil
      pg = Invite.find_by_token(@token).page_id
      debugger
      Connection.create(page_id: pg, editor_id: current_user.id)
      # redirect_to @invite.page
    else
      flash[:error] = "This invitation has already been used or is expired."
      # link_to("Request a new invite")
    end
  end

end