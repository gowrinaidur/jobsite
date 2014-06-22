class CreateJobSeekers < ActiveRecord::Migration
  def change
    create_table :job_seekers do |t|
      t.integer :offer_type
      t.date :availble_to_start
      t.integer :employment_status
      t.date :graduation_year
      t.string :city
      t.integer :state
      t.integer :country
      t.string :highest_educaton
      t.string :school
      t.string :major
      t.integer :work_experience
      t.integer :position_interested_in
      t.string :resume
      t.boolean :resume_status,         :default => true
      t.text :mail_notifications
      t.string :how_did_you_find_us
      t.boolean :terms_and_conditions,  :default => true
      t.timestamps
    end
  end
end
