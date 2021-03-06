class Topics::PostsController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new 
    authorize @topic
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
    @post.topic = @topic
    authorize @post

    if @post.save
      @post.create_vote
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Either it is too short, didn't have a title, or you didn't type anything ya turkey."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post

    if @post.update_attributes (params[:post])
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

    def destroy
        @topic = Topic.find(params[:topic_id])
        @post = @topic.posts.find(params[:post_id])
        @comment = @post.comments.find(params[:id])

        authorize @comment
        if @comment.destroy
          flash[:notice] = "You successfully destroyed this shit."
          redirect_to [@topic, @post]
        else
          flash[:error] = "Nice try but you blew it, try again."
          redirect_to [@topic, @post]
    end
  end
  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end