class StrangersController < ApplicationController
  def show
    @stranger = Stranger.find_by_uuid(params[:id])
  end

  def stay
    @stranger = Stranger.find_by_uuid(params[:id])
    @stranger.stay

    render json: {message: "OK"}.to_json
  end
end
