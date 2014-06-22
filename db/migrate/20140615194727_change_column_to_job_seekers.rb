class ChangeColumnToJobSeekers < ActiveRecord::Migration
  def change
  	rename_column :job_seekers , :highest_educaton , :highest_education
  end
end
