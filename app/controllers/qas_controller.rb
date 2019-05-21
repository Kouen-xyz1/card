class QasController < ApplicationController
  def index
#     qas = Qa.where(params[:episode_id]
     @qas = Qa.left_outer_joins(:results).select("qas.*, results.*")
  end

  def new
  end

  def create
    registered_count = import_qas
    redirect_to admins_path, notice: "#{registered_count}件登録しました"
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



  private

  def import_qas
      # 登録処理前のレコード数
      current_qa_count = ::Qa.count
      qas = []
      # windowsで作られたファイルに対応するので、encoding: "SJIS"を付けている
      CSV.foreach(params[:qas_file].path, headers: true) do |row|
        qas << ::Qa.new({ episode_id: row["episode_id"], order_in_episode: row["order_in_episode"], question: row["question"], answer: row["answer"], soundfile: row["soundfile"]})
      end
      # importメソッドでバルクインサートできる
      ::Qa.import(qas)
      # 何レコード登録できたかを返す
      ::Qa.count - current_qa_count
  end

end
