class Member < ActiveRecord::Base

    # RatyRate Gem
    ratyrate_rater

    # Associations
    has_many :ads
    has_many :comments
    has_one :profile_member
    accepts_nested_attributes_for :profile_member

    # Validations
    validate :nested_attributes
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def nested_attributes
    if nested_attributes_blank?
      errors.add(:base, "Primeiro ou segundo nome estão em branco")
    end
  end

  def nested_attributes_blank?
    profile_member.first_name.blank? || profile_member.second_name.blank?
  end
end
