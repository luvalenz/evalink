class Validation < ActiveRecord::Base #validaciones por expertos
  attr_accessible :comment
  belongs_to :ability
  belongs_to :user #Validador

end
