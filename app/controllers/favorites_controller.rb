class FavoritesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    favorite = @review.favorites.new(user_id: current_user.id)
    favorite.save
    # redirect_back fallback_location: @music

      # respond_to do |format|
      # format.html { redirect_back fallback_location: @music }
      # format.js
    # end
  end

  def destroy
    @review = Review.find(params[:review_id])
    favorite = current_user.favorites.find_by(review_id: @review.id)
    favorite.destroy
    # redirect_back fallback_location: @music

      # respond_to do |format|
      # format.html { redirect_back fallback_location: @music }
      # format.js
    # end
  end
end
