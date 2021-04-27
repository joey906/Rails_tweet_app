class CreateFrieds < ActiveRecord::Migration[6.0]
  def change
    create_table :frieds do |t|
      t.string :user_id
      t.string :frind_id

      t.timestamps
    end
  end
end
