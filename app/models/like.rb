class Like < ActiveRecord::Base
	belongs_to :likable, :polymorphic => true
	validates :user, uniqueness: true
end
