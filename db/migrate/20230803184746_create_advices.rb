class CreateAdvices < ActiveRecord::Migration[7.0]
  def change
    create_table :advices do |t|
      t.text          :content,        null: false
      t.boolean       :public,         null: false
      t.references    :user,    null: false, foreign_key: true
      t.references    :question,     null: false, foreign_key: true      
      t.timestamps
    end
  end
end
