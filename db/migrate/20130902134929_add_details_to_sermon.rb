class AddDetailsToSermon < ActiveRecord::Migration
  def change
    add_column :sermons, :speaker_id, :integer

    add_column :sermons, :book_id, :integer

    add_column :sermons, :featured, :boolean

    add_column :sermons, :start_chapter, :integer

    add_column :sermons, :end_chapter, :integer

    add_column :sermons, :start_verse, :integer

    add_column :sermons, :end_verse, :integer

  end
end
