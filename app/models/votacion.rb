class Votacion < ActiveRecord::Base
  attr_accessible :done
  belongs_to :expertise
  belongs_to :user
end
