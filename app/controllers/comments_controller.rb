class CommentsController < ApplicationController

  def create

    @review = Review.find(params[:review_id])
    @comment = @review.comments.new(params.require(:comment).permit(:body))
    @comment.user = @current_user
    @comment.save

    flash[:success] = "Your comment has posted"

    redirect_to review_path(@review)

  end
end
