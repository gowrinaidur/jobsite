class AddSlugToJobSeekers < ActiveRecord::Migration
  def change
  	add_column :job_seekers, :slug, :string
		add_index :job_seekers, :slug, unique: true
  end
end
