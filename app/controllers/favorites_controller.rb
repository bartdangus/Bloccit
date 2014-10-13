class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)

    authorize favorite
    if favorite.save
      flash[:notice] = "You favorited this"
      redirect_to [@post.topic, @post]
    else
      flash[:notice] = "Error"
      redirect_to [@post.topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)

    authorize favorite
    if favorite.destroy
      flash[:notice] = "You unfavorited that shit"
      redirect_to [@post.topic, @post]

    else
      flash[:notice] = "Something went wrong, try again"
      redirect_to [@post.topic, @post]
    end
  end
end 