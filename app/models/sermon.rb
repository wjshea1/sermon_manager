class Sermon < ActiveRecord::Base
  validates :title, :description, :audio_url, presence: true
end
