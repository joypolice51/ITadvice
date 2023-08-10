class CreateDirects < ActiveRecord::Migration[7.0]
  def change
    create_table :directs do |t|
      #不要 t.text     :content,     null: false
      #不要 t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
