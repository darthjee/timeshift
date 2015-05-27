class ChangeDayDateToNumber < ActiveRecord::Migration
  def up
    change_table :time_sheet_days do |t|
      t.integer :day
    end

    TimeSheet::Day.all.each do |d|
      d.update(day: d.date.day)
    end

    remove_column :time_sheet_days, :date
    change_column :time_sheet_days, :day, :integer, null: false
  end

  def down
    change_table :time_sheet_days do |t|
      t.date :date
    end

    TimeSheet::Day.all.each do |d|
      d.update(date: Date.new(d.month.year, d.month.month, d.day))
    end

    change_column :time_sheet_days, :date, :date, null: false
    remove_column :time_sheet_days, :day
  end
end
