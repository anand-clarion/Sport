class Athlete < ActiveRecord::Base
  devise :omniauthable
  scope :khajuraho_city, -> { where(city: 'khajuraho') }
  scope :name_with_himeesh, -> { where(name: "himeesh") }
  scope :scope_with_argument, -> (athleteid) { find(athleteid) }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :school
  belongs_to :team
  has_many :athlete_teams
  has_many :teams, through: :athlete_teams
  has_many :comments, :as => :commentable 
  has_many :likes, :as => :likable
  attr_accessor :term_and_condition
  # validates :term_and_condition, acceptance: true
  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100>" }, :default_url => "/user.gif"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :name, presence: true, uniqueness: true, on: :create
  validates :city, length: { minimum: 4 }
  validates :phone_no, length: { is: 10 , message: "Please Enter a valid 10 digit phone_no" }
  validates :school_id, presence: true
  validates :team_id, presence: true, if: Proc.new { |a| a.school_id.present? }
  # validate :school_name, on: :create

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    # athlete = Athlete.where(:provider => access_token.provider, :uid => access_token.uid ).first
    athlete = Athlete.where(:email => access_token.info.email).first
    if athlete
      return athlete
    else
      athlete = Athlete.create(name: data["name"],
        provider:access_token.provider,
        email: data["email"],
        uid: access_token.uid ,
        password: Devise.friendly_token[0,20],
      )
    end
  end

  def school_name
    errors.add(:base, "#{self.school.name} - school is not permitted") unless school_id.between?(1, 3)
  end
end

# Athlete belongs school. Athlete has many comments, athlete teams 
# and teams (through athlete teams)