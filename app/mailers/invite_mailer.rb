class InviteMailer < ActionMailer::Base
  default from: "maureen.adamo@gmail.com"

  def existing_user_invite(invite, sign_in_url)
    @url = root_url + sign_in_url
    @sender = invite.sender
    @page = invite.page
    @page_title = @page.title
    mail(to: invite.email, subject: "You've been invited to contribute to the \"#{@page_title}\" wiki page on Blocipedia." )
  end

  def new_user_invite(invite, registration_url)
    @url = root_url + registration_url
    @sender = invite.sender
    @page = invite.page
    @page_title = @page.title
    mail(to: invite.email, subject: "You\'ve been invited to contribute to the \"#{@wiki_page}\" wiki page on Blocipedia." )
  end

end
