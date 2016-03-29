class Stranger < ActiveRecord::Base

  def stay
    _duration = self.duration + 1
    update_attributes duration: _duration, last_stay_at: Time.now
  end
end
