class InvitesController < ApplicationController

  def create
    @invite = Invite.new(invite_params)
    @invite.sender_id = current_user.id

    if @invite.save

      if @invite.recipient != nil
        InviteMailer.existing_user_invite(@invite, new_user_session_path(invite_token: @invite.token)).deliver 
        @invite.recipient.pages.push(@invite.page)
        flash[:notice] = "Invite was sent."
      elsif
        InviteMailer.new_user_invite(@invite, new_user_registration_path(invite_token: @invite.token)).deliver
        flash[:notice] = "Invite was sent."
      else
        flash[:error] = "There was a problem sending your invitation. Please try again."
      end
      redirect_to @invite.page
    end
  
  end

  private

def invite_params
  params.require(:invite).permit(:page_id, :recipient_id, :email)
end

end