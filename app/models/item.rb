class Item < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :title

  validates :title, :presence => true,
                    :length => { :maximum => 50 }
  validates :description, :presence => true
end
