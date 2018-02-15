class ReviewsController < ApplicationController
  def index
    # This is our list page

    # We need to check if there is a filter
    @price = params[:price]
    @cuisine = params[:cuisine]
    @location = params[:location]

    # if @price.present?
    #   # filtering out the Reviews
    #   @reviews = Review.where(price: @price) #price: here is the database column
    # else
    #   # Show all the reviews
    #   @reviews = Review.all
    # end

    # Let's start with all the Reviews
    @reviews = Review.all

    # Filtering by price
    if @price.present?
      @reviews = @reviews.where(price: @price) #@reviews.where represents still the column of the db
    end

    # Filtering by cuisine
    if @cuisine.present?
      @reviews = @reviews.where(cuisine: @cuisine)
    end

    # Search near the location
    if @location.present?
      @reviews = @reviews.near(@location)
    end


  end

  def new
    # The form to adding a new review
    @review = Review.new
  end

  def create
    # Take info from the form and add it to the database
    @review = Review.new(form_params)

    # We want to check if the model can be saved?
    if @review.save
      # If it is we go to the homepage
      redirect_to root_path
    else
      # Showing the view from new.html.erb
      render 'new'
    end

    # Save it to the database
  end

  def show
    # The individual review page
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path
  end

  def edit
    # Edit the individual review page
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(form_params) # Update is similar to save to saves the recordi in the database automatically
      redirect_to review_path
    else
      render 'edit'
    end
  end

  def form_params
    params.require(:review).permit(:title, :body, :score, :restaurant, :ambiance, :cuisine, :price, :address)
  end

end
