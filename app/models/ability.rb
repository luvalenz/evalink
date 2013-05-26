class Ability < ActiveRecord::Base
  attr_accessible :description, :name, :area
  belongs_to :user
  has_many :validations


  def has_validations?
    validations != nil && validations != []
  end

end
