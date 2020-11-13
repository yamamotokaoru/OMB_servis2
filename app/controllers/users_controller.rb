class UsersController < ApplicationController
 before_action :authenticate_user!
 def show
 @user = User.find(params[:id])
 @blogs = @user.blogs.page(params[:page]).reverse_order # ここを記述
 if params[:tag_name]
   @blogs = Blog.tagged_with("#{params[:tag_name]}")
 end
end
end
