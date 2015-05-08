class CreateTimeSheetEntries < ActiveRecord::Migration
  def change
    create_table :time_sheet_entries do |t|
      t.integer :day_id, null: false
      t.time :time, null: false
      t.string :flow, null: false
    end
  end
end
