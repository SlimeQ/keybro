class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :scale
      t.integer :root

      t.timestamps
    end
  end
end
