class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :omniauthable, omniauth_providers: %i(google wechat)
  has_many :results, foreign_key: 'user_id', dependent: :destroy
  has_many :favorites, foreign_key: 'user_id', dependent: :destroy
  has_many :qas, through: :favorites, foreign_key: 'user_id', dependent: :destroy

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

  protected

  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)

    unless user
      user = User.create!(email:    auth.info.email,
                         provider: auth.provider,
                         uid:      auth.uid,
                         token:    auth.credentials.token,
                         password: SecureRandom.urlsafe_base64)
    end
    user
  end
end
