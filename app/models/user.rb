class User < ActiveRecord::Base
  # The  below rolify is for relationship of user roles
  rolify

  extend FriendlyId
  friendly_id :username, use: [:slugged,:finders]
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
 	
 	# Model Relationships 
 	belongs_to :accountable, :polymorphic => true  
  belongs_to :accountable_admin, :foreign_key => :accountable_id, :class_name => "Admin"   
  belongs_to :accountable_jobseeker, :foreign_key => :accountable_id, :class_name => "JobSeeker"   

  # Field Validations
  validates :first_name,:last_name,:email, presence: true  
  validates_uniqueness_of :email 
  validates :username, presence: true, length: {maximum: 255}, uniqueness: { case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]*\z/, message: "may only contain letters and numbers." }
  validates :username, exclusion: { in: %w(admin superuser) }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  
  # validates :password, presence: true, on: :create
  # validates :password, length: {minimum: 6}, on: :update, allow_blank: true
  # validates_confirmation_of :password, on: :create
  # validates_confirmation_of :password, on: :update, allow_blank: true
  #validates :phone ,numericality: { only_integer: true , equal_to: 10}

  # Active Record call backs
  after_save :assign_role

  attr_accessor :login

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def to_s
    first_name+" "+last_name
  end

  # Assigning the user role based on account type (Either Admin,JobSeeker and Employer)
  def assign_role
    if self.accountable_type.present?
      self.add_role self.accountable_type.to_s.tableize.singularize.to_sym
    else
      self.add_role "JobSeeker".tableize.singularize.to_sym
    end
  end


  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end