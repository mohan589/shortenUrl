class CreateApiShortners < ActiveRecord::Migration[5.1]
  def change
    create_table :api_shortners do |t|
      t.string :input_url
      t.string :slug

      t.timestamps
    end
  end
end
