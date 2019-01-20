class OyacategoriesController < ApplicationController



  def new
    redirect_to action: :index  unless current_user.id == User.find(1).id
    
    @oyacategory = Oyacategory.new
  end
  
  
  def create
  
   Oyacategory.create(oyacate_params)
   redirect_to root_path
   
  end
  
  private
  
  def oyacate_params
      params.require(:oyacategory).permit(:name, :user_id)
  end
  
end
