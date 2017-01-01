class CreateLabelings < ActiveRecord::Migration[5.0]
  def change
    create_table :labelings do |t|
      t.references :labelable, polymorphic: true, index: true
    end
  end
end
