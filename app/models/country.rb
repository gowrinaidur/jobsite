class Country < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: [:slugged,:finders]

  has_many :states
	
	validates :name,:code,presence: true
end
