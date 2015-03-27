class ListingsController < ApplicationController
  
  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

  def edit
  end

  def index
    Listing.get_new_listings
    Listing.create_new_listings(Listing.get_new_listings)
    Listing.add_images_to_listings(Listing.get_new_listings)
    twentyfive = Listing.last(25)
    @listings = []
    twentyfive.each do |x|
      if x.images.empty? == false
        @listings << x
      end
    end
    @listings = @listings.last(9).reverse
    @hash = Gmaps4rails.build_markers(@listings) do |listing, marker|
      marker.lat listing.lat
      marker.lng listing.long
    end
  end


  def show
    @listing = Listing.find(params[:id])
  end
  
end
