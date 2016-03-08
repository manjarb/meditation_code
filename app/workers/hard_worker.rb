class HardWorker
  include Sidekiq::Worker
  def perform(name, count)
    # do something
    #HardWorker.perform_async('bob', 5)
  end
end