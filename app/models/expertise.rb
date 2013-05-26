class Expertise < ActiveRecord::Base
  attr_accessible :area, :negative, :positive, :institution, :cargo
  belongs_to :user
  has_many :votacions
end
