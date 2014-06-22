class Admin::AdminsController < AdminBaseController
	before_action :set_admin, only: [:show, :edit, :update, :destroy]

  def index
    @admins = Admin.paginate(:page => params[:page])
  end

  def show
  end

  def new
    @admin = Admin.new
    @admin.build_user       
  end

  def edit
  end

  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to admin_admins_url, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        flash[:error] = @admin.errors.full_messages.map{|x| "<span>#{x}</span>" }.join('<br/>')
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        flash[:error] = @admin.errors.full_messages.map{|x| "<span>#{x}</span>" }.join('<br/>')
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admin_admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin      
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:status,user_attributes: [:first_name, :last_name,:username, :password, :password_confirmation, :email,:phone])      
    end
end
