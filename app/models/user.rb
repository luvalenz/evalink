class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :age, :university, :profession, :job_looking_for
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  belongs_to :company
  
  has_many :abilities
  has_many :expertises
  has_many :votacions

  has_many :validations #como validador, son las validaciones que hace, no las que le hacen
  
  def is_expert?(area)
    expertises.each do |e|
      if e.area == area
        return true
      end
    end
    false
  end

  def has_validated?(ability)
    validations.each do |v|
      if v.ability_id == ability.id
        return true
      end
    end
    false
  end

  def has_voted?(expertise)
    votacions.each do |v|
      if v.expertise_id == expertise.id
        return true
      end
    end
    false
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end

