class Admin < ActiveRecord::Base
	extend FriendlyId
  friendly_id :slug_string, use: [:slugged,:finders]

	#enum status: [ :active, :inactive ]

	STATUSES = {
		"Active"	=>	1,
		"Inactive"	=>	2		
	}
	
	has_one :user,:as => :accountable, :dependent => :destroy    
  accepts_nested_attributes_for :user, :allow_destroy => true

  default_scope { includes(:user) }

  validates_associated  :user

  def slug_string
  	SecureRandom.urlsafe_base64(5)
  end
end
