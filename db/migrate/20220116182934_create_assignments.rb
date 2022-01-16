class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.belongs_to :product
      t.belongs_to :warehouse
      t.timestamps
    end
  end
end
