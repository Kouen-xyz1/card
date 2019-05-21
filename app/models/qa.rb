require 'csv'


class Qa < ApplicationRecord
  has_many :results #これ正しいのかな？
  has_many :favorites, foreign_key: 'qa_id'
  has_many :users, through: :favorites, foreign_key: 'qa_id'
  belongs_to :episode
end
