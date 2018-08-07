class CreateRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :rewards do |t|
      t.string :name
      t.integer :cost
      t.string :img

      t.timestamps
    end
  end
end
