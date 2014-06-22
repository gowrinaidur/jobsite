require 'test_helper'

class JobSeekersControllerTest < ActionController::TestCase
  setup do
    @job_seeker = job_seekers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_seekers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_seeker" do
    assert_difference('JobSeeker.count') do
      post :create, job_seeker: { availble_to_start: @job_seeker.availble_to_start, city: @job_seeker.city, country: @job_seeker.country, employment_status: @job_seeker.employment_status, graduation_year: @job_seeker.graduation_year, highest_educaton: @job_seeker.highest_educaton, how_did_you_find_us: @job_seeker.how_did_you_find_us, mail_notifications: @job_seeker.mail_notifications, major: @job_seeker.major, offer_type: @job_seeker.offer_type, position_interested_in: @job_seeker.position_interested_in, resume: @job_seeker.resume, resume_status: @job_seeker.resume_status, school: @job_seeker.school, state: @job_seeker.state, terms_and_conditions: @job_seeker.terms_and_conditions, work_experience: @job_seeker.work_experience }
    end

    assert_redirected_to job_seeker_path(assigns(:job_seeker))
  end

  test "should show job_seeker" do
    get :show, id: @job_seeker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_seeker
    assert_response :success
  end

  test "should update job_seeker" do
    patch :update, id: @job_seeker, job_seeker: { availble_to_start: @job_seeker.availble_to_start, city: @job_seeker.city, country: @job_seeker.country, employment_status: @job_seeker.employment_status, graduation_year: @job_seeker.graduation_year, highest_educaton: @job_seeker.highest_educaton, how_did_you_find_us: @job_seeker.how_did_you_find_us, mail_notifications: @job_seeker.mail_notifications, major: @job_seeker.major, offer_type: @job_seeker.offer_type, position_interested_in: @job_seeker.position_interested_in, resume: @job_seeker.resume, resume_status: @job_seeker.resume_status, school: @job_seeker.school, state: @job_seeker.state, terms_and_conditions: @job_seeker.terms_and_conditions, work_experience: @job_seeker.work_experience }
    assert_redirected_to job_seeker_path(assigns(:job_seeker))
  end

  test "should destroy job_seeker" do
    assert_difference('JobSeeker.count', -1) do
      delete :destroy, id: @job_seeker
    end

    assert_redirected_to job_seekers_path
  end
end
