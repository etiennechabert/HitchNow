class PendingProfile < ActiveRecord::Base
    def self.create_collection(id_array)
        existing_id = self.where(id: id_array).map {|e| e.id}
        self.transaction do
            (id_array - existing_id).map {|e| self.create(id: e)}
        end
    end

    def generate_link
        "https://www.adopteunmec.com/profile/#{self.id}"
    end
end
