class CreatePendingProfiles < ActiveRecord::Migration
    def change
        create_table    :pending_profiles do |t|
            t.index     :id, unique: true
        end
    end
end
