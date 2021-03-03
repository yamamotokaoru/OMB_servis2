class AdduserIdToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :userid, :integer
  end
end
