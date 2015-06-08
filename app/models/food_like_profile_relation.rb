class FoodLikeProfileRelation < ActiveRecord::Base
    belongs_to :profile
    belongs_to :food_like
end
