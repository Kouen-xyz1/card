class AdminsController < ApplicationController
  def index
    @dramas = Drama.all
    @episodes = Episode.all
    @qas = Qa.all
  end

  def dramas_edit_all
    @dramas = Drama.all
  end

  def qas_edit_all
    @qas = Qa.all
  end


  def create
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
