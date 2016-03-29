class Stranger < ActiveRecord::Base

  def stay
    _duration = self.duration + 1
    update_attributes duration: _duration
  end
end
