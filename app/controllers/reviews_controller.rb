class ReviewsController < ApplicationController

  before_action :set_review, only: %i[ show edit update destroy ]
  
  def index
   	@reviews = Review.all
   	Rails.logger.info 'Index view accessed'
  end

  def show
  	@review = Review.find(params[:id])
   	Rails.logger.info 'Show view of Review no. '+ params[:id] + ' accessed'
  end

  def new
    @review = Review.new
   	Rails.logger.info 'New view accessed'
  end

  def edit
   	Rails.logger.info 'Edit view accessed'
  end

  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to review_url(@review), notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end

	#Rails.logger.info 'Show view of persons #' + review_params[:rating] + ' accessed'

    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:description, :rating, :relation, :professor_id)
    end

end
