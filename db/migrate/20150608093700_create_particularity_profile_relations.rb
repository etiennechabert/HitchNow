class CreateParticularityProfileRelations < ActiveRecord::Migration
    def change
        create_table :particularity_profile_relations do |t|
            t.integer :profile_id, null: false
            t.integer :particularity_id, null: false

            t.timestamps null: false
            t.index [:profile_id, :particularity_id], unique: true, name: 'particularity_profile_relation_on_profile_id_and_particularity'
        end
    end
end