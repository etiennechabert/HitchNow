class HairProfileRelation < ActiveRecord::Base
    belongs_to :hair
    belongs_to :profile
end
