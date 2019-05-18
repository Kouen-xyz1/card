class FavoritesController < ApplicationController

  def create
  @qa = Qa.find(params[:qa_id])
  current_user.like(@qa)
  end

  def destroy
    @qa = current_user.following_relationships.find(params[:id]).followed
    current_user.unfollow(@user)
  end

end
