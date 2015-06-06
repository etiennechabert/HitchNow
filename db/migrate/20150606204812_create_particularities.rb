class CreateParticularities < ActiveRecord::Migration
  def change
    create_table :particularities do |t|
        t.string    :value, null: false

        t.index :value, unique: true
    end
  end
end
