class ReviewsController < ApplicationController
 before_action :authenticate_user!, except:[:index, :show, :about]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /musics
  # GET /musics.json
  def index
    @reviews = Review.order("created_at").page(params[:page])
    if Rails.env.production?
    # 本番コード
    @randmusics = Review.order("RAND()").limit(5)
    else 
    # 開発環境コード
    @randmusics = Review.order("RANDOM()").limit(5)
    end
  end

  # GET /musics/1
  # GET /musics/1.json
  def show
    @user = @review.user
  end

  def about
  end

  # GET /musics/new
  def new
    @review = Review.new
  end

  # GET /musics/1/edit
  def edit
    if current_user.id != @review.user_id
       redirect_to reviews_path
    end
  end

  # POST /musics
  # POST /musics.json
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /musics/1
  # PATCH/PUT /musics/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Revieww was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musics/1
  # DELETE /musics/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :body, :image_id)
    end
end
