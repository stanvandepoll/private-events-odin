class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.references :event, foreign_key: true
      t.integer :attendee_id, index: true
      t.boolean :attending

      t.timestamps
    end
    add_foreign_key :attendees, :users, column: :attendee_id
  end
end
