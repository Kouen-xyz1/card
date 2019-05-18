require 'csv'


class Qa < ApplicationRecord
  has_many :results #これ正しいのかな？
  has_many :favorites
  has_many :users, through: :favorites

end
