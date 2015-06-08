class Profile < ActiveRecord::Base
    has_many :food_like_profile_relations, dependent: :destroy
    has_many :food_likes, through: :food_like_profile_relations
    has_many :hair_profile_relations, dependent: :destroy
    has_many :hairs, through: :hair_profile_relations
    has_many :hobby_profile_relations, dependent: :destroy
    has_many :hobbies, through: :hobby_profile_relations
    has_many :particularity_profile_relations, dependent: :destroy
    has_many :particularities, through: :particularity_profile_relations
    has_many :style_profile_relations, dependent: :destroy
    has_many :styles, through: :style_profile_relations

    belongs_to :location

    before_validation   :check_id
    after_create        :remove_pending

    def food_likes=(elements)
        self.food_like_profile_relations.destroy
        elements.each do |e|
            self.food_likes << FoodLike.find_or_create_by(value: e)
        end
    end

    def hairs=(elements)
        self.hair_profile_relations.destroy
        elements.each do |e|
            self.hairs << Hair.find_or_create_by(value: e)
        end
    end

    def hobbies=(elements)
        self.hobby_profile_relations.destroy
        elements.each do |e|
            self.hobbies << Hobby.find_or_create_by(value: e)
        end
    end

    def particularities=(elements)
        self.particularity_profile_relations.destroy
        elements.each do |e|
            self.particularities << Particularity.find_or_create_by(value: e)
        end
    end

    def styles=(elements)
        self.style_profile_relations.destroy
        elements.each do |e|
            self.styles << Style.find_or_create_by(value: e)
        end
    end

    def location=(elements)
        self.location_id = Location.find_or_create_by(elements).id
    end

    private

    def check_id
        return false if self.id.blank?
        true
    end

    def remove_pending
        pending = PendingProfile.find_by_id(self.id)
        if pending
            pending.destroy
        end
    end
end
