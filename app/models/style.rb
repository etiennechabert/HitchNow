class Style < ActiveRecord::Base
    has_many :style_profile_relations
    has_many :profiles, through: :style_profile_relations
    
end
