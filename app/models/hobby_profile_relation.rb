class HobbyProfileRelation < ActiveRecord::Base
    belongs_to :hobby
    belongs_to :profile
end
