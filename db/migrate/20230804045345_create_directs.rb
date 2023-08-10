class CreateDirects < ActiveRecord::Migration[7.0]
  def change
    create_table :directs do |t|
      t.timestamps
    end
  end
end
