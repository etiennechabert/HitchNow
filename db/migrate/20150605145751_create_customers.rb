class CreateCustomers < ActiveRecord::Migration
  def change
    create_table    :customers do |t|
        t.string    :username, null: false
        t.string    :email, null: false
        t.string    :password, null: false

        t.timestamps null: false
    end
  end
end
