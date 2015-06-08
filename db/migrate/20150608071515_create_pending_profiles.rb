class CreatePendingProfiles < ActiveRecord::Migration
    def change
        create_table    :pending_profiles, id: false do |t|
            t.integer   :id, null: false

            t.index     :id, unique: true
        end
    end
end
