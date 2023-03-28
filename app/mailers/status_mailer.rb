class StatusMailer < ApplicationMailer
    def new_status_mail
        @notice = params[:notice]

        mail(to: "harshake.p@cisinlabs.com", subject: "You got a new order!")
    end
end
