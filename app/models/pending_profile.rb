class PendingProfile < ActiveRecord::Base
    before_validation :check_id

    def check_id
        return false if Profile.find_by_id(self.id)
        true
    end

    def self.create_collection(id_array)
        existing_id = self.where(id: id_array).map {|e| e.id}
        self.transaction do
            (id_array.uniq.map{|e| e.to_i} - existing_id).map {|e| self.create(id: e)}
        end
    end

    def generate_link
        "https://www.adopteunmec.com/profile/#{self.id}"
    end
end
