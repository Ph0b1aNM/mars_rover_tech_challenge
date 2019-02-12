class CreateRoverinputs < ActiveRecord::Migration[5.1]
  def change
    create_table :roverinputs do |t|
      t.integer :sopx
      t.integer :sopy
      t.integer :r1px
      t.integer :r1py
      t.string :r1pface
      t.string :inst1
      t.integer :r2px
      t.integer :r2py
      t.string :r2pface
      t.string :inst2

      t.timestamps
    end
  end
end
