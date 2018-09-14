class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :phone_number, index: true
      t.timestamps
    end
  end
end
