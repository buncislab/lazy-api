class CreateMateris < ActiveRecord::Migration[5.1]
  def change
    create_table :materis do |t|
      t.string :title
      t.string :file
      t.string :description
      t.references :user, foreign_key: true
      t.references :kelas, foreign_key: true

      t.timestamps
    end
  end
end
