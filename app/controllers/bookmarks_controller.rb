class BookmarksController < ApplicationController

    before_action :check_login #Check login is coming from application controller

    def create
        #Find the review we want to bookmarked
        @review = Review.find(params[:review_id]) # We need to find the review_id and not the bookmark_id so that's why it's not simply params[:id]

        @bookmark = @review.bookmarks.new
        @bookmark.user = @current_user
        @bookmark.save
        redirect_to review_path(@review)
    end

    def destroy
        @review = Review.find(params[:review_id])

        @review.bookmarks.where(user: @current_user).delete_all # We need to check if there is a bookmark from the current user
        redirect_to review_path(@review)
    end
end
