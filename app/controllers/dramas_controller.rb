class DramasController < ApplicationController

  def index
    @dramas = Drama.all
  end

  def create
    #binding.pry
    drama = Drama.new
    drama.title_japanese = params[:title_japanese]
    drama.title_english =  params[:title_english]
    drama.save
    redirect_to admins_path
  end

  def new
    @drama = Drama.new
  end

  def edit_all
    @dramas = Drama.all
  end

  def edit
  end

  def show
  end


  def update
  #  binding.pry
    drama = Drama.find(params[:id])
    drama.title_japanese = params[:drama][:title_japanese]
    drama.title_english = params[:drama][:title_english]
  #  binding.pry
    drama.save
    @dramas = Drama.all
    render :edit_all
  end

  def destroy
  end


end
