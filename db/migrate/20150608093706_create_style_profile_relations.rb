class CreateStyleProfileRelations < ActiveRecord::Migration
    def change
        create_table :style_profile_relations do |t|
            t.integer :profile_id, null: false
            t.integer :style_id, null: false

            t.timestamps null: false
            t.index [:profile_id, :style_id], unique: true, name: 'particularity_profile_relation_on_profile_id_and_particularity'
        end
    end
end
