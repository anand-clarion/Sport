class School < ActiveRecord::Base
  has_many :athletes
  has_many :teams
  accepts_nested_attributes_for :teams
  validates_associated :teams
  has_many :games, through: :teams
  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100>" }, :default_url => "/school.jpeg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :name, length: { minimum: 5 }
  validates :address, length: { minimum: 8 }


  def self.search(search)
    if search
       where("name like ? OR address like ?", "%#{search}%","%#{search}%") 
    end
  end
end
 # School has many athletes, teams and games (through teams)