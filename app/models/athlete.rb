class Athlete < ActiveRecord::Base
  scope :khajuraho_city, -> { where(city: 'khajuraho') }
  scope :name_with_himeesh, -> { where(name: "himeesh") }
  scope :scope_with_argument, -> (athleteid) { find(athleteid) }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :school
  has_many :athlete_teams
  has_many :teams, through: :athlete_teams
  has_many :comments, :as => :commentable 
  has_many :likes, :as => :likable
  attr_accessor :term_and_condition, :team_id
  validates :term_and_condition, acceptance: true
  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100>" }, :default_url => "/user.gif"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

# Athlete belongs school. Athlete has many comments, athlete teams 
# and teams (through athlete teams)