class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|

      t.string :title , :null => false
      t.text :content , :null => false
      #t.string :status , :null => false

      t.references :admin_user, index: true

      t.timestamps null: false
    end

    add_index :blogs, :id, unique: true
  end
end
