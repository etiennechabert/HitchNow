class CreateLocations < ActiveRecord::Migration
    def change
        create_table    :locations do |t|
            t.string    :city, null: false
            t.string    :country, null: false
            t.float     :latitude
            t.float     :longitude

            t.index [:city, :country], unique: true
        end
    end
end
