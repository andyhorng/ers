class AdminSessionsController < ApplicationController

  def new
    @admin_session = AdminSession.new
  end

  def create
    @admin_session = AdminSession.create(params[:admin_session])
    if @admin_session.save
      flash[:notice] = "Login Successful!"
      redirect_to root_url
    else 
      redirect_to new_admin_session_url
    end
  end

  def destroy
    current_admin_session.destroy
    flash[:notice] = "Logout Successful!"
    redirect_to root_url
  end

end
