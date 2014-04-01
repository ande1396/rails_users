class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :content
      t.integer :commenter_id, index:true
      t.integer :commented_id, index:true

      t.timestamps
    end
  end
end
