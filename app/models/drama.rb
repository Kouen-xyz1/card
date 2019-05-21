class Drama < ApplicationRecord
  has_many :episodes, foreign_key: 'drama_id' #

end
