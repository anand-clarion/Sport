class Score < ActiveRecord::Base
	belongs_to :game
	belongs_to :athlete
end
#- Score belongs to game and athlete