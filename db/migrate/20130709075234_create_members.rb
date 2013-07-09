class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string  :username
      t.string  :passwd
      t.string  :animal
      t.string  :content
      t.timestamps
    end
  end
end
