class MyDevise::RegistrationsController < Devise::RegistrationsController
  after_filter :assign_editor, :only => :create

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
      email = Invite.find_by_token(@token).email
      user = User.where(email: "#{email}")
      pg = Invite.find_by_token(@token).page_id
      Connection.create(page_id: pg, editor_id: user.first.id)
      # redirect_to @invite.page
    else
      flash[:error] = "This invitation has already been used or is expired."
      # link_to("Request a new invite")
    end
  end

end