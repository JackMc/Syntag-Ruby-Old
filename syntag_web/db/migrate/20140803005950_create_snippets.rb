class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :title
      t.belongs_to :language
      t.text :contents
      
      t.timestamps
    end
  end
end
