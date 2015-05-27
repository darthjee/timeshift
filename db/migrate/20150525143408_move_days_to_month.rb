class MoveDaysToMonth < ActiveRecord::Migration
  def up
    create_table :time_sheet_months do |t|
      t.integer :year
      t.integer :month
      t.integer :sheet_id, null: false
      t.timestamps
    end

    change_table :time_sheet_days do |t|
      t.integer :month_id
    end

    TimeSheet::Day.all.each do |d|
      d.update(month: Builder.new(d).build)
    end

    change_column :time_sheet_days, :month_id, :integer, null: true
    remove_column :time_sheet_days, :sheet_id
  end

  def down
    change_table :time_sheet_days do |t|
      t.integer :sheet_id, null: false
    end

    TimeSheet::Day.all.each do |d|
      d.update(sheet_id: d.month.sheet_id)
    end

    remove_column :time_sheet_days, :month_id
    drop_table :time_sheet_months
  end

  private

  class Builder
    attr_reader :day
    def initialize(day)
      @day = day
    end

    def build
      @month ||= (find_month || create_month)
    end

    def find_month
      TimeSheet::Month.find_by(attributes)
    end

    def create_month
      TimeSheet::Month.create(attributes)
    end

    def attributes
      {
        year: day.date.year,
        month: day.date.month,
        sheet_id: day.sheet_id
      }
    end
  end
end
