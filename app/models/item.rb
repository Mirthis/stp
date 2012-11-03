class Item < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  attr_accessible :description, :title, :pictures_attributes

  accepts_nested_attributes_for :pictures, :allow_destroy => true

  validates :title, :presence => true,
                    :length => { :maximum => 50 }
  validates :description, :presence => true
end
