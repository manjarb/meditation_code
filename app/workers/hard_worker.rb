class HardWorker
  include Sidekiq::Worker
  def perform(user_id)
    # do something
    #HardWorker.perform_async('bob', 5)
    user_active = User.find_by(id: user_id)
    UserMailer.reservation_details_mailer(user_active).deliver_now
  end
end