class CreateParticulars < ActiveRecord::Migration
    def change
        create_table    :particulars do |t|
            t.string    :value, null: false

            t.index     :value, unique: true
        end
    end
end
