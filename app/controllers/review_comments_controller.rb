class ReviewCommentsController < ApplicationController
	def create
	    @mreview = Review.find(params[:review_id])
	    comment = current_user.review_comments.new(review_comment_params)
	    comment.review_id = @review.id
	    comment.save
	    # redirect_to review_path(
	end
	def destroy
	    @review_comment = ReviewComment.find(params[:review_id])
	    @review = @review_comment.review
	    if @review_comment.user != current_user
	       redirect_to request.referer
	    end
	    @review_comment.destroy
	    # redirect_to review_path

    end
	private
	def review_comment_params
	    params.require(:review_comment).permit(:user_id,:review_id,:comment)
	end
end
