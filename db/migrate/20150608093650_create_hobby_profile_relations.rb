class CreateHobbyProfileRelations < ActiveRecord::Migration
    def change
        create_table :hobby_profile_relations do |t|
            t.integer :profile_id, null: false
            t.integer :hobby_id, null: false

            t.timestamps null: false
            t.index [:profile_id, :hobby_id], unique: true
        end
    end
end
