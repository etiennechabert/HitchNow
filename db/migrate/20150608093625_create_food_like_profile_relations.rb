class CreateFoodLikeProfileRelations < ActiveRecord::Migration
    def change
        create_table :food_like_profile_relations do |t|
            t.integer :profile_id, null: false
            t.integer :food_like_id, null: false

            t.timestamps null: false
            t.index [:profile_id, :food_like_id], unique: true
        end
    end
end
