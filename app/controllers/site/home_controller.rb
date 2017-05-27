class Site::HomeController < SiteController

  def index
    @categories = Category.order_by_description
    @ads = Ad.descending_order(params[:page])
    if Rails.env.development?
        @carousel = Ad.limit(3).order("RANDOM()")
    else
        @carousel = Ad.limit(3).order("RAND()")
    end
  end
end
