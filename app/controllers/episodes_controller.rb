class EpisodesController < ApplicationController
  def index
  end

  def create
    episode = Episode.new
    episode.drama_id = params[:drama_id]
    episode.episode =  params[:episode]
    episode.save
    redirect_to admins_path
  end

  def new
  end

  def edit
  end

  def show
  end


  def update
  end

  def destroy
  end
end
