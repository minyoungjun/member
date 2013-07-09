class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :member_id
      t.string  :savedname
      t.string  :realname
      t.timestamps
    end
  end
end
