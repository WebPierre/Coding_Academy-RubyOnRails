class Product < ApplicationRecord
  belongs_to :user
  has_many :labels, through: :labelings
  has_many :labelings, as: :labelable, dependent: :destroy

  validates :title, length: { in: 3..50 }
  validates :description, length: { minimum: 2 }, allow_blank: true
  validates :price, numericality: { greater_than: 0 }
  validates :user_id, presence: true

  accepts_nested_attributes_for :labels, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
