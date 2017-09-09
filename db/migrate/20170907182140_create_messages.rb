class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :recipient_id
      t.references :user, foreign_key: true
      t.references :conversation, foreign_key: true
      t.text :body

      t.timestamps
    end
    add_index :messages, :recipient_id
  end
end
