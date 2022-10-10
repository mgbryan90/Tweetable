class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to comments_path # /tweets
    else
      render "new", status: :unprocessable_entity
    end
  end

  def new 
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])   
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to tweet_path(@comment.tweet_id), notice: "Comment was successfully update."
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    
    @comment.destroy
    redirect_to comment_path, status: :see_other, notice: "Comment was successfully destroyed."
  end

  def comment_params
    params.require(:comment).permit(:body, :tweet_id)
  end

end
