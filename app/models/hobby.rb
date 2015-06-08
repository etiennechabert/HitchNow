class Hobby < ActiveRecord::Base
    has_many :hobby_profile_relations
    has_many :hobbies, through: :hobby_profile_relations
end
