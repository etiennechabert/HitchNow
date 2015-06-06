class CreatePendingLinks < ActiveRecord::Migration
  def change
      create_table  :pending_links do |t|
          t.string  :uri, null: false

          t.index :uri, unique: true
      end
  end
end
