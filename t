
[1mFrom:[0m /home/ubuntu/workspace/mintoo/app/controllers/posts_controller.rb @ line 56 PostsController#create:

    [1;34m51[0m:         
    [1;34m52[0m:         [1;34m#  current_user.posts.create(post_params)だけでは下のif @postがno methoderrorになってしまったので、@postに入れてあげたら動いた[0m
    [1;34m53[0m:         
    [1;34m54[0m:         @post = current_user.posts.new(post_params)
    [1;34m55[0m: 
 => [1;34m56[0m:        binding.pry
    [1;34m57[0m:         [32mif[0m @post.valid?
    [1;34m58[0m:             
    [1;34m59[0m:             
    [1;34m60[0m:             [32mif[0m @post.imagetexts.present? && @post.posttools.present?
    [1;34m61[0m:                 

