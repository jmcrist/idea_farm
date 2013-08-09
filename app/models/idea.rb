class Idea < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
