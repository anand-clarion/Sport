class School < ActiveRecord::Base
	has_many :athletes
	has_many :teams
	has_many :games, through: :teams
	has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100>" }, :default_url => "/school.jpeg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
 # School has many athletes, teams and games (through teams)