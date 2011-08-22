module Admin
  class UsersController < Admin::Controllers::Resource

    before_filter do
      @full_width = true
    end

    def destroy
      if current_admin_user.id != params[:id].to_i
        destroy!
      else
        flash[:error] = t('admin.delete_current_user')
        redirect_to admin_users_path
      end
    end

  end
end
