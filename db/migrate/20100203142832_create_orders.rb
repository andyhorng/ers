class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.datetime :odatetime
      t.string :sid
      t.string :sclass
      t.string :name
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
