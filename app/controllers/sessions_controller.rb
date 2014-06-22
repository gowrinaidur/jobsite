class SessionsController < Devise::SessionsController
	def create						
		begin
			if current_user
				if params[:login_type]=="admin"
					if current_user.has_role?(:admin)
						redirect_to(admin_path)
					else
						sign_out(current_user)
						redirect_to(root_url,:alert=>"Please check your credentials")
					end
				else										
					if current_user.has_role? :employer
						redirect_to(employers_path)
					elsif current_user.has_role? :job_seeker
						redirect_to(job_seekers_path)
					else
						sign_out(current_user)
				 		redirect_to(root_url,:alert=>"Please check your credentials")						
					end
				end				
			else
				if params[:login_type]=="admin"				
					redirect_to(admin_login_url,:alert=>"Please check your credentials")
				else
					redirect_to(root_url,:alert=>"Please check your credentials")
				end
			end
		rescue Exception => e
			render :action => "create"
		end
	end

	def destroy
    super
    reset_session    
  end
end
