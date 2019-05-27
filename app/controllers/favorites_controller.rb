class FavoritesController < ApplicationController

  def favorite_like
    qa = Qa.find(params[:qa_id])
    current_user.like(qa)
    render json: { status: 'like_success'}
  end

  def favorite_unlike
    qa = Qa.find(params[:qa_id])

      current_user.unlike(qa)
      render json: { status: 'unlike_success'}

  end

end
