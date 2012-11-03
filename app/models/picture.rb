class Picture < ActiveRecord::Base
  belongs_to :item
  attr_accessible :picture, :picture_file_name

  has_attached_file :picture, :styles => { :large => "640x480", 
                                          :medium => "300x300>", 
                                          :thumb => "100x100>" }

end
