class ChangeColumnsToJobSeeker < ActiveRecord::Migration
  def change
  	remove_column :job_seekers, :state
  	remove_column :job_seekers, :country
  	add_column :job_seekers , :state_id , :integer
  	add_column :job_seekers , :country_id , :integer
  end
end
