


class Sermon < ActiveRecord::Base


 # has_one :speaker, :class_name => Speaker, :foreign_key => speaker_id
 # has_one :book, :class_name => Book, :foreign_key => book_id
   belongs_to :speaker
   belongs_to :book

end
