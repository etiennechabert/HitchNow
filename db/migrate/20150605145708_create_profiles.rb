class CreateProfiles < ActiveRecord::Migration
    def change
        create_table    :profiles, :id => false do |t|
            t.string    :id, null: false
            t.integer   :age, default: ''
            t.string    :eyes, default: ''
            t.string    :profession, default: ''
            t.string    :origins, default: ''
            t.string    :alcohol, default: ''
            t.string    :smoke, default: ''
            t.string    :alimentation, default: ''

            t.integer   :popularity, null: false
            t.integer   :charms, null: false
            t.integer   :visits, null: false
            t.integer   :bucket, null: false
            t.integer   :total, null: false

            t.date      :last_connection, null: false
            t.boolean   :online, null: false
        end
    end
end
