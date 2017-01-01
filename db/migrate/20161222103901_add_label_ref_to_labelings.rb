class AddLabelRefToLabelings < ActiveRecord::Migration[5.0]
  def change
    add_reference :labelings, :label, foreign_key: true
  end
end
