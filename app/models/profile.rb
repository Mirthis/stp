class Profile < ActiveRecord::Base
  attr_accessible :bio, :birth_date, :first_name, :last_name, :gender
  belongs_to :user

  validates_presence_of :first_name, :last_name, :gender, :birth_date, :user

  validates :first_name, :length   => { :in => 2..30 }
  validates :last_name, :length => { :in => 2..30 }
  validates :bio, :length => { :in => 2..500 }, :allow_blank => true
  validates :gender, :inclusion => { :in => ['M', 'F']}
  validate :birth_date_range_is_valid

  def birth_date_range_is_valid
    if !birth_date.blank? and (birth_date.year >= Date.today.year or birth_date.year < 1910)
      errors.add(:birth_date, "Birth date year should be between 1900 and #{(Date.today.year) -1}")
    end
  end
end
