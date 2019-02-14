class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :check
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :introduction, :avatar, :twitter_account])
    devise_parameter_sanitizer.permit(:edit, keys: [:nickname, :introduction, :avatar, :twitter_account])
  end
  
  
  $oyacategories = Oyacategory.all
  
  $categories = Category.all
  
  $tools = Tool.all
  
  $likes = Like.all
  
  $users = User.order(likes_count: :desc).first(5)
  
  $comments = Comment.order(created_at: :desc).first(5)
 
  
  private
  def check
    binding.pry
  end

  
end
