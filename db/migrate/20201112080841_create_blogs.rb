class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string "image_id"
      t.integer "user_id"
      t.text "title"
      t.text "body"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.datetime "start_time"
      t.string "address"
      t.float "latitude"
      t.float "longitude"
      t.integer "status", default: 0, null: false
      t.timestamps
    end
  end
end
