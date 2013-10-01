class AddPublishDateToSermons < ActiveRecord::Migration
  def change
    add_column :sermons, :publish_date, :datetime
  end
end
