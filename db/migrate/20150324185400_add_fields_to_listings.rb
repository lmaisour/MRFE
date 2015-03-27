class AddFieldsToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :external_url, :string
  	add_column :listings, :heading, :string
  	add_column :listings, :body, :text
  	add_column :listings, :price, :integer
  	add_column :listings, :bathrooms, :integer
  	add_column :listings, :bedrooms, :integer
  	add_column :listings, :pets, :boolean
  	add_column :listings, :lat, :float
  	add_column :listings, :long, :float
  	add_column :listings, :address, :string
  	add_column :listings, :zipcode, :integer
  	add_column :listings, :city, :string
  end
end
