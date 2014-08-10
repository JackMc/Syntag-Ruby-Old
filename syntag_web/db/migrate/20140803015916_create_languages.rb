class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.string :highlighter_name
      t.string :code_editor_name

      t.timestamps
    end
  end
end
