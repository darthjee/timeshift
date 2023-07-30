class CreateActiveSetting < ActiveRecord::Migration[7.0]
  def change
    create_table :active_settings do |t|
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
