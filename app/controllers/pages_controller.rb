class PagesController < ApplicationController

  def home
    if signed_in?
      @user = current_user
    else
      @user = User.new
      if cookies[:stranger_id]
        @stranger = Stranger.find_by(uuid: cookies[:stranger_id])
      else
        uuid = SecureRandom.uuid
        cookies[:stranger_id] = { value: uuid, expires: 1.year.from_now }
        @stranger = Stranger.create(uuid: uuid, duration: 0)
      end
    end
  end

  def status
    @online_users = User.where("last_stay_at > ?", 3.minutes.ago)
    @online_strangers = Stranger.where("last_stay_at > ?", 3.minutes.ago)
  end
end
