class FoodLike < ActiveRecord::Base
    has_many :food_like_profile_relations, dependent: :destroy
    has_many :profiles, through: :food_like_profile_relations
end
