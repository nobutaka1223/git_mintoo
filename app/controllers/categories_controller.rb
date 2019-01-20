class CategoriesController < ApplicationController
   
    def new
        redirect_to action: :index  unless user_signed_in?
        
        @category = Category.new
    end
    
    def create
        
        #current_user.tool.create(tool_params)
        Category.create(category_params)
        redirect_to root_path
    end
    
    private
    def category_params
        params.require(:category).permit(:oyacategory_id,:name,:user_id)
    end
    
end
