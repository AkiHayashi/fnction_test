class MailJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    UserMailer.with(to: user.email, name: user.name).welcome.deliver_later
  end
end
