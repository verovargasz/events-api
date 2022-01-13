class ChangeDateToDatetime < ActiveRecord::Migration[6.1]
  change_column :events, :start_date, :datetime
  change_column :events, :end_date, :datetime
end
