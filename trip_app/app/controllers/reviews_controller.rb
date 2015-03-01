class ReviewsController < ApplicationController

  def create_activity_review
    unless find_reviewable_activity.reviews.build(review_params).save
      flash[:notice] = "Review validation failed"
    end
    # :back is native?
    redirect_to :back
  end

  def create_itinerary_review
    binding.pry
    unless find_reviewable_itinerary.reviews.build(review_params).save
      binding.pry
      flash[:notice] = "Review validation failed"
    end
    # :back is native?
    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

  def find_reviewable_itinerary
    params.each do |name, value|
      if name =~ /(.+)_id$/
        binding.pry
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def find_reviewable_activity
    params.each do |name, value|
      if name =~ /(.+)_id$/
        binding.pry
        return $2.classify.constantize.find(value)
      end
    end
    nil
  end

end
