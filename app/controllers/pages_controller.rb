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
end
