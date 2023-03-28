# Preview all emails at http://localhost:3000/rails/mailers/status
class StatusPreview < ActionMailer::Preview
    def new_notice_mail
        notice = Notice.new(subject: "test mail", description: "test description")
        StatusMailer.with(notice: notice).new_status_mail
    end   
end
