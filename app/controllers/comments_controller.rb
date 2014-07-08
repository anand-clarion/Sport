class CommentsController < ApplicationController

  # This action show all comments 
  def index
    @comments = Comment.all
  end

  # This action creates an instance for new comment
  def new
    @commentable = find_commentable
    @comments = @commentable.comments.new
  end

  # This action insert a new record in comments table
  def create 
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)  
    if @comment.save  
      redirect_to path(find_commentable)
    else  
      render :action => 'new'  
    end  
  end  

  def show
  end

  # This action edit a comment information
  def edit 
    @commentable = find_commentable
    @comment = @commentable.comments.find(params[:id])
  end

  # This action update a comment information
  def update
    @commentable = find_commentable
    @comment = @commentable.comments.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to path(find_commentable) 
    end
  end

  # This action delete a record from comments table
  def destroy
    @commentable = find_commentable
    @commentable.comments.find(params[:id]).destroy
    redirect_to path(find_commentable)
  end

  # This action find attributes for a comment crud functionality
  def find_commentable
    # abort params.inspect
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
  end

  # This action find path for redirect after comment crud functionality
  def path(commentable)
      if Athlete === commentable
        return athletes_url
      else
        return games_url
      end
  end
  
  # This action permit accessible attributes
  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end
  
end
