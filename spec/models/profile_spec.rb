require 'spec_helper'

describe Profile do
  
  before do
    @attr = {
      first_name:   "Andrea",
      last_name:    "Cardinale",
      birth_date:   DateTime.new(1982,12,15),
      gender:       "M", 
      bio:          "I'm still learning Rails"   
    }
  end

  it "should create a new instance given valid attributes" do
    Profile.create!(@attr)
  end

  it "should require a first name" do
    blank_first_name_profile = Profile.new(@attr.merge(:first_name => ""))
    blank_first_name_profile.should_not be_valid    
  end

  it "should reject a short first name" do
    short_first_name_profile = Profile.new(@attr.merge(:first_name => "a"))
    short_first_name_profile.should_not be_valid    
  end

  it "should reject a long first name" do
    long_first_name_profile = Profile.new(@attr.merge(:first_name => "a" * 31))
    long_first_name_profile.should_not be_valid    
  end

  it "should reject and invalid formatted first name" do
    pending
  end

  it "should require a last name" do
    invalid_last_name_profile = Profile.new(@attr.merge(:last_name => ""))
    invalid_last_name_profile.should_not be_valid    
  end

  it "should reject a short last name" do
    short_last_name_profile = Profile.new(@attr.merge(:last_name => "a"))
    short_last_name_profile.should_not be_valid    
  end

  it "should reject a long last name" do
    long_last_name_profile = Profile.new(@attr.merge(:last_name => "a" * 31))
    long_last_name_profile.should_not be_valid    
  end

  it "should reject and invalid formatted first name" do
    pending
  end

  it 'should require a birth date' do
    blank_birth_date_profile = Profile.new(@attr.merge(:birth_date => ''))
    blank_birth_date_profile.should_not be_valid
  end

  it 'should accept valid birth dates' do
    birth_dates = [Date::civil(1910,1,1), Date::civil(Date.today.year-1,12,31)]
    birth_dates.each do |date|
      valid_birth_date_profile = Profile.new(@attr.merge(:birth_date => date))
      valid_birth_date_profile.should be_valid
    end
  end

  it 'should reject invalid birth dates' do
    birth_dates = [Date::civil(1909,12,31), Date::civil(Date.today.year,1,1)]
    birth_dates.each do |date|
      invalid_birth_date_profile = Profile.new(@attr.merge(:birth_date => date))
      invalid_birth_date_profile.should_not be_valid
    end
  end
  
  it 'should require gender' do
    blank_gender_profile = Profile.new(@attr.merge(:gender => ''))
    blank_gender_profile.should_not be_valid
  end

  it 'should accept valid genders' do
    genders = ['M', 'F']
    genders.each do |gender|
      valid_gender_profile = Profile.new(@attr.merge(:gender => gender))
      valid_gender_profile.should be_valid
    end
  end

  it 'should reject invalid genders' do
    genders = ['abcd','G','123']
    genders.each do |gender|
      invalid_gender_profile = Profile.new(@attr.merge(:gender => gender))
      invalid_gender_profile.should_not be_valid
    end
  end
  
  it 'should accept blank biography' do
    blank_bio_profile = Profile.new(@attr.merge(:bio => ''))
    blank_bio_profile.should be_valid
  end

  it 'should reject long biographies' do
    valid_bio_profile = Profile.new(@attr.merge(:bio => 'A' * 501))
    valid_bio_profile.should_not be_valid
  end
end