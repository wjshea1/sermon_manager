class RemoveFieldNameFromSermon < ActiveRecord::Migration
  def up
    remove_column :sermons, :speaker
      end

  def down
    add_column :sermons, :speaker, :string
  end
end
