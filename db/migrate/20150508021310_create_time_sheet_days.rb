class CreateTimeSheetDays < ActiveRecord::Migration
  def change
    create_table :time_sheet_days do |t|
      t.string :observation
      t.integer :sheet_id, null: false
      t.date :date, null: false
      t.integer :expected, null: false, default: 0
      t.timestamps
    end
  end
end
