class CreateDirectUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :direct_users do |t|
      t.references    :user,    null: false, foreign_key: true
      t.references    :direct,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
