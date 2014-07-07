class CommentsController < ApplicationController
	def index
    @comments = Comment.all
	end

	def new
    @commentable = find_commentable
    @comments = @commentable.comments.new
  end

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

	def edit 
    @commentable = find_commentable
    @comment = @commentable.comments.find(params[:id])
	end

  def update
    @commentable = find_commentable
    @comment = @commentable.comments.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to path(find_commentable) 
    end
  end

  def destroy
    @commentable = find_commentable
    @commentable.comments.find(params[:id]).destroy
    redirect_to path(find_commentable)
  end

  def find_commentable
    # abort params.inspect
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
  end
  def path(commentable)
     if Athlete === commentable
       return athletes_url
     else
       return games_url
     end
   end
  
   def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end
end
