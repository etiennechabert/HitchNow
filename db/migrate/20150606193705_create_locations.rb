class CreateLocations < ActiveRecord::Migration
    def change
        create_table    :locations do |t|
            t.string    :name, null: false
            t.float     :latitude
            t.float     :longitude
        end
    end
end
