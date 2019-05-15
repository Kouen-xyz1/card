class QasController < ApplicationController
  def index
    @qas = Qa.all
  end


  def show
    @qa = Qa.find(params[:id])
  end

  def edit
    @qa = Qa.find(params[:id])
  end

  def update
    @qa = Qa.find(params[:id])

    if @qa.update(qa_params)
      flash[:success] = 'Message は正常に更新されました'
      redirect_to @qa
    else
      flash.now[:danger] = 'Message は更新されませんでした'
      render :edit
    end

  end

  def edit_all
    @qas = Qa.all

  end

  def qa_params
    params.require(:qa).permit(:question, :answer, :soundfile)
  end


end
