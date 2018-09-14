class SessionsController < ApplicationController
  
  def new
    @meta_tag = "noindex nofollow"
  end
  
  def create
    session[:current_user_id] = @user.id
  end
  
  def destroy
    @meta_tag= "noindex"
    
    session[:user_id] = nil
    redirect_to root_path
  end
  
  
  
end