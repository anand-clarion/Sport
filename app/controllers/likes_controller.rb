class LikesController < ApplicationController

  # This action insert a new record in likes table
  def new
    @likable = Athlete.find(params[:athlete])
    like = Like.new(likable_id: @likable.id , likable_type: @likable.class , user: current_user.id)
    if like.save
      @likes_count = @likable.likes.count
      respond_to do |format|
        format.js
      end
    end
  end
  
  # This action delete an record from likes table
  def delete
    @likable = Athlete.find(params[:athlete])
    like = Like.where(likable_id: @likable.id , likable_type: @likable.class , user: current_user.id).last
    if like.destroy
      @likes_count = @likable.likes.count
      respond_to do |format|
        format.js
      end
    end
  end

  # This action find attributes for a like object crud functionality
  def find_likable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
  end
  
  # This action permit accessible attributes
  def likes_params
    params.require(:like).permit(:value, :likable_id, :likable_type, :user)
  end

  # This action find path for redirect after like crud functionality
  def path(commentable)
    if Athlete === commentable
      return athletes_url
    else
      return games_url
    end
  end
   
end
