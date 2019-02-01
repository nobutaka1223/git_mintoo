class PostsController < ApplicationController
      #before_action :authenticate_user!
    # before_action :twitter_client, only: [:create]
    before_action :login_required, only: [:tweet, :follow, :follow_check]
    
    def index
    
        @posts = Post.includes(:user,:imagetexts).order("created_at DESC").page(params[:page]).per(10)
       
        
    end
    
    
    
    def show
        
        @post = Post.includes(:user,:imagetexts).find(params[:id])
        @comments = @post.comments
        
        if @post.user_id == current_user.id && @post.unread == 1
            @post.update_attribute(:unread, 0)
        end
            
        
        render :layout => "second_layout"
        
    end


    def new
        redirect_to action: :index  unless user_signed_in?
      
        
        @post = Post.new
        @post.imagetexts.build
        # @twitter_checkbox= true
        @error = params[:flash][:error] unless params[:flash].blank?
        

          render :layout => "second_layout"
        
        
    end


    def create
        
            
        #  current_user.posts.create(post_params)だけでは下のif @postがno methoderrorになってしまったので、@postに入れてあげたら動いた
                
        @post = current_user.posts.new(post_params)
    
        
        if @post.valid?
            
            
            if @post.imagetexts.present?
                
                @post.save
            else
            
                redirect_to action: :new, flash: { error: "投稿の内容（見出し・本文・画像）のいずれかを入力してください。" }  and return

            end   
                
            
      
            redirect_to action: :create_done and return
          
        else
            
            
            redirect_to action: :new, flash: { error: @post.errors.full_messages }  and return

            
            
        end

        
    end


    def ranking
        @posts = Post.includes(:user,:imagetexts).all.order("likes_count DESC").page(params[:page]).per(10)

    end
    
    def ascendant
        @posts = Post.includes(:user,:imagetexts).order("created_at ASC").page(params[:page]).per(10)
    end
       
        
        


 
    
    def edit
        redirect_to action: :index  unless user_signed_in?
        @post = Post.find(params[:id])
        
        render :layout => "second_layout"
    end


    def update
        
     
    
        @post = Post.find(params[:id])
        
        
       
    
       
        
        if @post.imagetexts
            
          @post.update(update_post_params)   
            
       
          redirect_to action: :create_done and return
          
        else
            
            render 'edit_post_path' and return
        end
        
    end
   
        
        


    def destroy
        
        post = Post.find(params[:id])

        post.destroy if post.user_id == current_user.id
        
        @user = current_user
    end

    
    

    private
    
    def post_params
        params.require(:post).permit(
            :user_id,
            :title, 
            :tool_id, 
            :youtube,
            
            imagetexts_attributes:[:id, :image, :content, :status, :subtitle])
            
    end
    
    def    update_post_params
        params.require(:post).permit(
            :user_id,
            :title, 
            :tool_id, 
            :youtube,
            
            imagetexts_attributes:[:id, :image, :content, :status, :subtitle, :_destroy])
            
    end

    
    def move_to_index
        redirect_to action: unless user_signed_in?
        end
    end
    
    
  
            
    
end
