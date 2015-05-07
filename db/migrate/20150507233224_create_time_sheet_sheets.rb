class CreateTimeSheetSheets < ActiveRecord::Migration
  def change
    create_table :time_sheet_sheets do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
