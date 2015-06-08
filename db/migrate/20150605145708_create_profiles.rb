class CreateProfiles < ActiveRecord::Migration
    def change
        create_table    :profiles do |t|
            t.string    :picture, null: false
            t.integer   :age, default: ''
            t.string    :eyes, default: ''
            t.string    :profession, default: ''
            t.string    :origins, default: ''
            t.string    :alcohol, default: ''
            t.string    :smoke, default: ''
            t.string    :alimentation, default: ''
            t.string    :apparence, default: ''
            t.integer   :height, default: nil
            t.integer   :weight, default: nil

            t.integer   :popularity, null: false
            t.integer   :mails, null: false
            t.integer   :charms, null: false
            t.integer   :visits, null: false
            t.integer   :buckets, null: false
            t.integer   :total, null: false

            t.integer   :location_id, default: nil

            t.datetime  :last_connection, null: false
            t.boolean   :online, null: false
        end
    end
end
