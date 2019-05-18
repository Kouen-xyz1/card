class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :results
  has_many :favorites
  has_many :qas, through: :favorites

  def like(qa)
    favorites.find_or_create_by(qa_id: qa.id)
  end

  def unlike(qa)
    favorite = favorites.find_by(qa_id: qa.id)
    favorite.destroy if favorite
  end

  def like?(qa)
    qas.include?(qa)
  end

end
