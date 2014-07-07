class LikesController < ApplicationController
	def new
    @likable = find_likable
    @value = @likable.likes.count
    @value += 1
    like = Like.new(likable_id: @likable.id , likable_type: @likable.class , user: current_user.id)
    # abort  @likable.class.inspect
    if like.save
      redirect_to path(find_likable)
    else 
      redirect_to path(find_likable)
    end
	end

  def create
    @likable = find_likable
    # abort @likable.id.inspect
    @like = Like.where(likable_id: @likable.id).where(likable_type: @likable.class).last
    Like.destroy(@like)
    redirect_to path(find_likable)
  end

  def find_likable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
  end
  
  
  def likes_params
    params.require(:like).permit(:value, :likable_id, :likable_type, :user)
  end
  def path(commentable)
    if Athlete === commentable
      return athletes_url
    else
      return games_url
    end
  end
end
