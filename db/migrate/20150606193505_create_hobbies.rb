class CreateHobbies < ActiveRecord::Migration
    def change
        create_table    :hobbies do |t|
            t.string    :value, null: false

            t.index     :value, unique: true
        end
    end
end
