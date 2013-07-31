class Venue < ActiveRecord::Base
  has_many :events
  # Geocoder gem geocoding
  geocoded_by :full_address
  before_save :geocode
  # protect from hax
  attr_accessible :name, :address, :city, :subdivision, :country, :postal_code, :website

  def full_address
  	if self.country.downcase === 'sweden' || self.country.downcase === 'germany'
      self.address + ", " + self.postal_code + " " + self.city + ", " + self.country
    else
      self.address + ", " + self.city + ", " + self.subdivision + " " + self.country 
    end
  end
end
