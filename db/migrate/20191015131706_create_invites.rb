class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.string :location
      t.datetime :date_time
      t.string :status
      t.references :sender
      t.references :recipient

      t.timestamps
    end
    add_foreign_key :invites, :users, column: :sender_id
    add_foreign_key :invites, :users, column: :recipient_id
  end
end
