class RemoveUserForBlogs < ActiveRecord::Migration[5.2]
  def up
    remove_column :blogs, :user
      end

  def down
    add_column :blogs, :user, :string
  end
end
