class HardWorker
  include Sidekiq::Worker

  def perform(name, sec)
    p ">>>>>#{name}>>>>>#{sec}>>>>>"
  end
end
