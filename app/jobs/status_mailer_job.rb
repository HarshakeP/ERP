class StatusMailerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    StatusMailer.with(notice: @notice).new_status_mail.deliver_later(wait_until: 2.minutes.from_now)
  end
end
