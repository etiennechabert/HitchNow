class CreateStyles < ActiveRecord::Migration
    def change
        create_table    :styles do |t|
            t.string    :value, null: false

            t.index     :value, unique: true
        end
    end
end
