class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :alias
      t.string :http
      t.string :UUID
      t.integer :user_id

      t.timestamps
    end
  end
end
