class CreateSermons < ActiveRecord::Migration
  def change
    create_table :sermons do |t|
      t.string :title
      t.text   :description
      t.string :image_url
      t.string :audio_url
      t.string :speaker
      t.text   :keywords
   
      t.timestamps
    end
  end
end
