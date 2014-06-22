class Admin::JobSeekersController < AdminBaseController
	before_action :set_job_seeker, only: [:show, :edit, :update, :destroy]

  def index
    @job_seekers = JobSeeker.paginate(:page => params[:page])
  end
  
  def show
  end

  def new
    @job_seeker = JobSeeker.new
    @job_seeker.build_user
  end
  
  def edit
  end

  def create    
    @job_seeker = JobSeeker.new(job_seeker_params)    

    respond_to do |format|
      if @job_seeker.save
        format.html { redirect_to @job_seeker, notice: 'Job seeker was successfully created.' }
        format.json { render :show, status: :created, location: @job_seeker }
      else
        flash[:error] = @job_seeker.errors.full_messages.map{|x| "<span>#{x}</span>" }.join('<br/>')        
        format.html { render :new }
        format.json { render json: @job_seeker.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update        
    respond_to do |format|
      if @job_seeker.update(job_seeker_params)
        format.html { redirect_to @job_seeker, notice: 'Job seeker was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_seeker }
      else
        flash[:error] = @job_seeker.errors.full_messages.map{|x| "<span>#{x}</span>" }.join('<br/>')
        format.html { render :edit }
        format.json { render json: @job_seeker.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job_seeker.destroy
    respond_to do |format|
      format.html { redirect_to job_seekers_url, notice: 'Job seeker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_seeker
      @job_seeker = JobSeeker.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "job seeker not found ."
      redirect_to_back_or_default
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_seeker_params
      params.require(:job_seeker).permit(:offer_type, :how_did_you_find_us, :availble_to_start, :employment_status, :graduation_year, :city, :state_id, :country_id, :highest_education, :school, :major, :work_experience, :position_interested_in, :resume, :resume_status, :terms_and_conditions,user_attributes: [:first_name, :last_name,:username, :email, :password, :password_confirmation,:phone], :mail_notifications => [] )
    end
end
