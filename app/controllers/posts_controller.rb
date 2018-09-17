class PostsController < ApplicationController
      #before_action :authenticate_user!
    before_action :twitter_client, only: [:create]
    
    def index
        @posts = Post.includes(:user,:imagetexts).order("created_at DESC").page(params[:page]).per(5)
        
     
        
    end
    
    
    
    def show
        @post = Post.includes(:user,:imagetexts).find(params[:id])
        @comments = @post.comments
        
    end


    def new
        redirect_to action: :index  unless user_signed_in?
        
        @post = Post.new
        @post.imagetexts.build
        
        
    end


    def create
        
            
        #  current_user.posts.create(post_params)だけでは下のif @postがno methoderrorになってしまったので、@postに入れてあげたら動いた
                
        @post = current_user.posts.create(post_params)
    
        
        
        if @post.save
    
            
            
            @client.update("#{@post.title}\r")
            redirect_to root_path
        else
            
            render 'new'
        end
   
        
        
    end


    def ranking
        @posts = Post.includes(:user,:imagetexts).all.order("likes_count DESC")

    end


 
    
    def edit
        redirect_to action: :index  unless user_signed_in?
        @post = Post.find(params[:id])
    end



    def destroy
        
        post = Post.find(params[:id])

        post.destroy if post.user_id == current_user.id
    end

    
    

    private
    
    def post_params
        params.require(:post).permit(
            :user_id,
            :title, 
            :tool_id, 
            :youtube,
            imagetexts_attributes:[:image, :content, :status])
            
    end

    
    def move_to_index
        redirect_to action: unless user_signed_in?
        end
    end
    
    
    def twitter_client
        @client = Twitter::REST::Client.new do |config|
            config.consumer_key =  ENV['TWITTER_API_KEY']
            config.consumer_secret = ENV['TWITTER_API_SECRET']
            
            config.access_token = ENV['ACCESS_TOKEN']
            config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
            
      
        end   
    end
            
    
end
