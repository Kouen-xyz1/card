class ResultsController < ApplicationController
  def index
    @dramas = Drama.all
    @episodes = Episode.all
    #@qas = Qa.left_outer_joins(:results).select("qas.id, qas.question, qas.answer, qas.soundfile, results.result, results.updated_at").order("results.updated_at")

  end

  def show
    @results = Result.where(user_id: current_user.id)
  end

  def show_all
    @qas = Qa.left_outer_joins(:results).select("qas.episode_id, qas.id, qas.question, qas.answer, qas.soundfile, results.result, results.updated_at").order("results.updated_at")
    @qas = @qas.where(episode_id:params[:episode_id])
    @qa_question = @qas.first.question
    @qa_answer = @qas.first.answer
    @qa_first_id = @qas.first.id
    @qa_length = @qas.length
  end

  def show_ng
    わからん
    @qas = Qa.left_outer_joins(:results).select("qas.episode_id, qas.id, qas.question, qas.answer, qas.soundfile, results.result, results.updated_at").order("results.updated_at")
    @qas = @qas.where(episode_id:params[:episode_id], result:'ng')
    @qa_question = @qas.first.question
    @qa_answer = @qas.first.answer
    @qa_first_id = @qas.first.id
    @qa_length = @qas.length
  end

  def show_ok
    @qas = Qa.left_outer_joins(:results).select("qas.episode_id, qas.id, qas.question, qas.answer, qas.soundfile, results.result, results.updated_at").order("results.updated_at")
    @qas = @qas.where(episode_id:params[:episode_id])
    @qa_question = @qas.first.question
    @qa_answer = @qas.first.answer
    @qa_first_id = @qas.first.id
    @qa_length = @qas.length
  end

  def show_not_answered
#    @qas = Qa.left_outer_joins(:results).select("qas.id, qas.question, qas.answer, qas.soundfile, results.result, results.updated_at").where(result: nil).order(:updated_at)
  end

  def ok
    result = Result.find_or_create_by(user_id: params[:user_id], qa_id: params[:qa_id])
    result.result = 'ok'
    result.touch
    result.save
    render json: { status: 'ok_success'}
  end

  def ng
    result = Result.find_or_create_by(user_id: params[:user_id], qa_id: params[:qa_id])
    result.result = 'ng'
    result.touch
    result.save
    render json: { status: 'ng_success'}
  end


end
