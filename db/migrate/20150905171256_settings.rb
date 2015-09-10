class Settings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string  :name, default: '', null: false
      t.string  :value, default: '', null: false
      t.integer :system, default: 1, null: false
      t.timestamps null: false
    end
  end
end
