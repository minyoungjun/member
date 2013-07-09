class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :member_id
      t.string  :cont
      t.timestamps
    end
  end
end
