class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :caption
      t.float :longitude
      t.float :lattitude
      t.references :user, null: false, foreign_key: true
      t.boolean :allow_comments
      t.boolean :show_likes_count

      t.timestamps
    end
  end
end
