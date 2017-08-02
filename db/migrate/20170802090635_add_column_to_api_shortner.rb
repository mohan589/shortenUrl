class AddColumnToApiShortner < ActiveRecord::Migration[5.1]
  def change
    add_column :api_shortners, :num_of_clicks, :integer, :null => false, :default => 0
  end
end
