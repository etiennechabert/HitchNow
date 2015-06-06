class CreateFoodLikes < ActiveRecord::Migration
    def change
        create_table    :food_likes do |t|
            t.string    :value, null: false

            t.index     :value, unique: true
        end
    end
end
