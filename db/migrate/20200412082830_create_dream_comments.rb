class CreateDreamComments < ActiveRecord::Migration[5.2]
  def change
    create_table :dream_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :dream_id


      t.timestamps
    end
  end
end
