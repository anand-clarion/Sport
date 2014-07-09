class Game < ActiveRecord::Base
  has_many :game_teams
  has_many :scores
  has_many :teams, through: :game_teams
  has_many :comments, :as => :commentable
  has_many :likes, :as => :likable
  attr_accessor :start_time_dt, :school1, :school2
end

# Game belongs to team, Game has many comments, game teams, scores, teams (through game teams)
