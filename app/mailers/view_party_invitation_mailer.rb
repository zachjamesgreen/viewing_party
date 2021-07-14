class ViewPartyInvitationMailer < ApplicationMailer
  def invitation_email
    @view_party = params[:view_party]
    @host = User.find(@view_party.user_id)
    @recipients = @view_party.view_party_users.map { |vpu| vpu.user }
    @recipients.each { |user| invite(user, @view_party) }
  end

  def invite(user, party)
    mail(to: user.email, subject: "You've been invited to watch #{party.movie_title}")
  end
end
