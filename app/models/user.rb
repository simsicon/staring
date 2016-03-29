class User < ActiveRecord::Base
  has_secure_password

  def count_login
    _count = self.login_count + 1
    update_attributes login_count: _count
  end

  def stay
    _duration = self.login_duration + 1
    update_attributes login_duration: _duration
  end
end
