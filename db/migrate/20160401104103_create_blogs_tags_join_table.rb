class CreateBlogsTagsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :blogs, :tags do |t|
      t.index :blog_id
      t.index :tag_id
    end

    add_index :blogs_tags, [:blog_id, :tag_id]

  end
end
