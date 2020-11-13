class BlogsController < ApplicationController
 def new
  @blog = Blog.new
end
def create
  @blog = current_user.blogs.new(blogs_params)
  if @blog.save
    flash[:notice] = "投稿完了しました！"
    redirect_to user_path(current_user.id)
  else
    render :new
  end 
end 
def index
  @blogs = Blog.all
  if params[:tag_name]
    @blogs = Blog.tagged_with("#{params[:tag_name]}")
  end
end
def show
  @blog = Blog.find(params[:id])
  if (@blog.published? || @blog.user_id= current_user.id && @blog.draft?)
    render "show"
  else
    flash[:alert] = "非公開です "
    redirect_to root_path
  end
end
def edit
  @blog = Blog.find(params[:id])
  if @blog.user.id == current_user.id 
    render "edit"
  else
    redirect_to root_path
  end
end
def update
  @blog = Blog.find(params[:id])

  if @blog.update(blogs_params)
    flash[:notice] = "投稿編集完了しました！"
    redirect_to user_path(current_user.id)
  else
    render :edit
  end
end
def destroy
  @blogs = Blog.find(params[:id])
  @blogs.destroy
  redirect_to user_path(current_user.id)
end

private
def blogs_params
  params.require(:blog).permit(:title, :body, :image, :start_time, :tag_list, :tag_name, :address, :status)
end

end
