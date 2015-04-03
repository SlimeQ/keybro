class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :steps
      t.integer :root
      t.string :tuning
      t.string :interval

      t.timestamps
    end
  end
end
