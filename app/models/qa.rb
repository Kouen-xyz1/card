require 'csv'


class Qa < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :favorites, foreign_key: 'qa_id', dependent: :destroy
  has_many :users, through: :favorites, foreign_key: 'qa_id', dependent: :destroy
  belongs_to :episode
end
