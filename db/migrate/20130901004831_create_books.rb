class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :testament
      t.integer :chapter_count

      t.timestamps
    end
  end
end
