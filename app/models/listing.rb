class Listing < ActiveRecord::Base
validates_uniqueness_of :heading

	def self.convert_to_utc
		day = Date.today
		time = day.to_time
		unix = time.to_i
		unix.to_s
	end

	def self.get_new_listings
		api_key = ENV["api_key"]
		response = HTTParty.get("http://polling.3taps.com/poll?auth_token=7e53474c2e150233dc488e90832debd7&anchor=1949751160&source=CRAIG&category_group=RRRR&category=RHFR&location.county=USA-CA-LOS&retvals=location,external_url,heading,body,timestamp,price,images,annotations")
		output = JSON.parse(response.body)
		properties = output["postings"] 
	end

	def self.create_new_listings(new_listings)
		if new_listings != nil
			new_listings.each do |property|
				if property["location"]["zipcode"] != nil && property["location"]["formatted_address"] != nil && property["location"]["city"] != nil
					Listing.create(external_url: property["external_url"], heading: property["heading"], 
					body: property["body"], price: property["price"], bathrooms: property["annotations"]["bathrooms"], 
					bedrooms: property["annotations"]["bedrooms"], lat: property["location"]["lat"], long: property["location"]["long"], 
					address: property["location"]["formatted_address"], zipcode: property["location"]["zipcode"].gsub(/[^\d]/, '').to_i, 
					city: property["location"]["city"])
				end
			end
		end
	end

	def self.add_images_to_listings(new_listings)
		if new_listings != nil
			new_listings.each do |property|		
				listing = Listing.where(external_url: property["external_url"]).first
				if listing != nil
					property["images"].each do |x|
						listing.images << x["full"]
						listing.save
					end
				end
			end
		end
	end


end
