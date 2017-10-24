class ReviewsController < ApplicationController

  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :find_product, only: [:create, :edit, :update]
  before_action :ensure_logged_in, except: [:show]
  before_action :ensure_user_wrote_review, only: [:edit, :update, :destroy]

  def create
    @review = Review.create
    @review.review = params[:review][:review]
    @review.product = @product
    @review.user_id = current_user.id

    if @review.save
      redirect_to @product
    end
  end

  def edit
  end

  def update
    @review.review = params[:review][:review]
    @review.product = @product

    if @review.save
      flash.notice = "Review has been successfully updated."
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    if @review.destroy
      flash[:notice] = "Review has been successfully deleted."
      redirect_to product_path(params[:product_id])
    else
      render :show
    end
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def ensure_user_wrote_review
    unless current_user == @review.user
      flash[:alert] = "Please log in first."
      redirect_to new_sessions_url
    end
  end
end
