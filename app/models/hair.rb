class Hair < ActiveRecord::Base
    has_many :hair_profile_relations
    has_many :hair, through: :hair_profile_relations

end
