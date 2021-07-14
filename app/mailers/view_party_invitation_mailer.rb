class ViewPartyInvitationMailer < ApplicationMailer
  def invitation_email
    @view_party = params[:view_party]
    
    @recipients = @view_party.view_party_users.map { |vpu| vpu.user }
    @url = 'heroku.url'
    @recipients.each { |user| invite(user, @view_party) }
  end

  def invite(user, party)
    mail(to: user.email, subject: "You've been invited to watch #{party.movie_title}")
  end
end
