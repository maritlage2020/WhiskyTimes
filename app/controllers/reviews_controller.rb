class ReviewsController < ApplicationController
 before_action :authenticate_user!, except:[:index, :show, :about]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /musics
  # GET /musics.json
  def index
    @reviews = Review.order("created_at").page(params[:page])
    if Rails.env.production?
    # 本番コード
    @randreviews = Review.order("RAND()").limit(5)
    else 
    # 開発環境コード
    @randreviews = Review.order("RANDOM()").limit(5)
    end
  end


  def show
    @user = @review.user
    @review_comment = ReviewComment.new
  end

  def about
  end


  def new
    @review = Review.new
  end


  def edit
    if current_user.id != @review.user_id
       redirect_to reviews_path
    end
  end


  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id

      if @review.save
              redirect_to @review, notice: 'Review was successfully created.'
      else
        render :new
      end
  end


  def update
      if @review.update(review_params)
        redirect_to @review, notice: 'Revieww was successfully updated.'
      else
        render :edit
      end
  end


  def destroy
    @review.destroy
    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :body, :review_image)
    end
end