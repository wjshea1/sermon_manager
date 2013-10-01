class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name
      t.boolean :guest

      t.timestamps
    end
  end
end
