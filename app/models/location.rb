class Location < ActiveRecord::Base
    has_many :profiles

    #todo: setup geocoder
end
