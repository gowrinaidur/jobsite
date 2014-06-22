class JobSeeker < ActiveRecord::Base
	extend FriendlyId
  friendly_id :slug_string, use: [:slugged,:finders]  

  mount_uploader :resume, FileUploader

	OFFER_TYPE =  {
		1=>"Phone Card",
		2=>"Resume Blast",
		3=>"Mock Interview",
		4=>"Resume Help & Career Guidence"
	} 	

	EMPLOYMENT_STATUS = {
		1=>"OPT",
		2=>"CPT",
		3=>"F1",
		4=>"H1B",
		5=>"EAD",
		6=>"GC",
		7=>"Citigen",
		8=>"H4",
		9=>"L1",
		10=>"Others"
	}
 

	HIGHEST_EDUCATION = {
		1	=>	"Bachelors",
		2	=>	"Masters",
		3	=>	"MBA",
		4	=>	"Other",
		5	=>	"PhD"
	}

	WORK_EXPERIENCE = {
		1	=>	"0-1Year",
		2	=>	"1-2Years",
		3	=>	"3+ Years"
	}

	POSITION_INTERSTED_IN = {
		1 =>	"Deveoper"	,
		2	=>	"Tester",
		3	=> "Busness Analyst3"
	}

	MAILNOTIFICATIONS={
    1 => 'Received News Letter',
    2 => 'New Job Notification'    
  }

  has_one :user,:as => :accountable, :dependent => :destroy
  belongs_to :country
  belongs_to :state    

  accepts_nested_attributes_for :user, :allow_destroy => true

  #Scopes
  default_scope { includes(:user) }

	serialize :mail_notifications , Array 

	validates_associated  :user
	validates :availble_to_start,:city ,presence: true
	
  #validates_acceptance_of :terms_and_conditions
	#validates :terms_and_conditions, acceptance: { accept: 1 }  

	 #["id", "offer_type", "availble_to_start", "employment_status", "graduation_year", "city", "state", "country", "highest_educaton", "school", "major", "work_experience", "position_interested_in", "resume", "resume_status", "mail_notifications", "how_did_you_find_us", "terms_and_conditions", "created_at", "updated_at"] 	

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_string
  	SecureRandom.urlsafe_base64(5)
  end

	def mail_notifications
    read_attribute(:mail_notifications) || []
  end

  def mail_notifications=(perms)
    perms = perms.collect {|p| p unless p.blank? }.compact.uniq if perms
    write_attribute(:mail_notifications, perms)
  end



end
