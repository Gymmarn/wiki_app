class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :wiki_id

      t.timestamps
    end
    add_index :comments, :wiki_id
  end
end
