class PostsController < ApplicationController
    
    
    before_action :move_to_index, except: :index
    
    def index
        @posts = Post.order("id DESC").page(params[:page]).per(5)
    end

    def new
    
    end

    def create
        Post.create(post_params)
    end

    private
    def post_params
        params.permit(:name, :image,)
    end
    
    def move_to_index
        redirect_to action: unless use_signed_in
    end
            

end
