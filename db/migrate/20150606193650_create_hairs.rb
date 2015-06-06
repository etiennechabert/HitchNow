class CreateHairs < ActiveRecord::Migration
    def change
        create_table    :hairs do |t|
            t.string    :value, null: false

            t.index     :value, unique: true
        end
    end
end
