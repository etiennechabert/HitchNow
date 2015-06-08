class StyleProfileRelation < ActiveRecord::Base
    belongs_to :style
    belongs_to :profile
end
