class CommentsController < ApplicationController

  def create
    
    @post = Post.find(params[:post_id]) 
    @topic = @post.topic
  

    @comment = current_user.comments.build(params[:comment].permit!)
    @comment.post = @post

    if @comment.save
      flash[:notice] = "Comment was created"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render 'posts/show'
    end
  end

    def destroy
      
      @post = Post.find(params[:post_id])
      @topic = @post.topic
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
end

 