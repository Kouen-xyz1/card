class ResultsController < ApplicationController
  def index
    @results = Result.all
  end

  def show
    @results = Result.where(user_id: current_user.id)
  end

  def show_ng
    @results = Result.where(user_id: current_user, result: 'ng')
  end

  def show_ok
    @results = Result.where(user_id: current_user, result: 'ok').order('updated_at DESC')
  end

  def ok
    result = Result.find_or_create_by(user_id: params[:user_id], qa_id: params[:qa_id])
    result.result = 'ok'
    result.save
    redirect_to results_path
  end

  def ng
    result = Result.find_or_create_by(user_id: params[:user_id], qa_id: params[:qa_id])
    result.result = 'ng'
    result.save
    redirect_to results_path
  end
end
