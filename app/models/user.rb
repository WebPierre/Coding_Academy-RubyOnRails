class User < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :labels, through: :labelings
  has_many :labelings, as: :labelable, dependent: :destroy

  has_secure_password
  validates_presence_of :password, :on => :create

  validates :email, :uniqueness => true, :case_sensitive => false, :format => {:with => /\A[a-z0-9._-]+@[a-z0-9._-]{1,}\.[a-z]{2,3}\z/i}
  validates :username, length: { in: 2..15 }
  validates :password, length: { in: 2..25 }

  accepts_nested_attributes_for :labels, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
