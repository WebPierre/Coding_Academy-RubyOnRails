class Labeling < ApplicationRecord
  belongs_to :label, dependent: :destroy
  belongs_to :labelable, polymorphic: true
end
