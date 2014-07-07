class Team < ActiveRecord::Base
	belongs_to :school
	has_many :athlete_teams
	has_many :athletes, through: :athlete_teams
	has_many :game_teams
	has_many :games, through: :game_teams
	has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100>" },:default_url => "/team.jpeg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
#Team has many athlete teams, athletes (through athlete teams),
#game teams, games (through game teams)