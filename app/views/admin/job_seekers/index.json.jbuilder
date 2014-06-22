json.array!(@job_seekers) do |job_seeker|
  json.extract! job_seeker, :id, :offer_type, :mail_notifications, :how_did_you_find_us, :availble_to_start, :employment_status, :graduation_year, :city, :state, :country, :highest_educaton, :school, :major, :work_experience, :position_interested_in, :resume, :resume_status, :terms_and_conditions
  json.url job_seeker_url(job_seeker, format: :json)
end
