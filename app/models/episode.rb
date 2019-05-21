class Episode < ApplicationRecord
  belongs_to :drama
  has_many :qas
end
