class CreateHairProfileRelations < ActiveRecord::Migration
    def change
        create_table :hair_profile_relations do |t|
            t.integer :profile_id, null: false
            t.integer :hair_id, null: false

            t.timestamps null: false
            t.index [:profile_id, :hair_id], unique: true
        end
    end
end
