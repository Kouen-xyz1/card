class Drama < ApplicationRecord
  has_many :episodes, foreign_key: 'drama_id' , dependent: :destroy

end
