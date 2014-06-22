class State < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: [:slugged,:finders]

  belongs_to :country

  validates :name,:country_id,presence: true 
	
end
