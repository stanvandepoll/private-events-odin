class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :location
      t.integer :creator_id, index: true

      t.timestamps
    end
    add_foreign_key :creator, :users, column: :creator_id
  end
end
