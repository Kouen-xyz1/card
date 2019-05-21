class Episode < ApplicationRecord
  belongs_to :drama
  has_many :qas, foreign_key: 'episode_id'
end
