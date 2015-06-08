class Particularity < ActiveRecord::Base
    has_many :particularity_profile_relations
    has_many :particularities, through: :particularity_profile_relations
end
