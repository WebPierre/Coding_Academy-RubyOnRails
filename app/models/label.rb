class Label < ApplicationRecord
  has_many :labelings, dependent: :destroy
  has_many :products, through: :labelings
  has_many :users, through: :labelings

  validates :title, :presence => true

  def products_labelables
    labelableId = Labeling.select("labelable_id").where(labelable_type: 'Product', label_id: self.id)
    return Product.where(id: labelableId)
  end

  def users_labelables
    labelableId = Labeling.select("labelable_id").where(labelable_type: 'User', label_id: self.id)
    return User.where(id: labelableId)
  end
end
