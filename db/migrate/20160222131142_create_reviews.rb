class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comment, :null => false
      t.integer :score, :null => false

      t.references :user, index: true
      t.references :activity, index: true

      t.timestamps null: false
    end

    add_index :reviews, :id, unique: true
  end
end
