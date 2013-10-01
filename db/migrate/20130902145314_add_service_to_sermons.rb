class AddServiceToSermons < ActiveRecord::Migration
  def change
    add_column :sermons, :service, :string

  end
