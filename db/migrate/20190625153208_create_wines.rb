class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |w|
      w.string :winery
      w.string :wine_name
      w.string :wine_variety
      w.integer :wine_vintage
      w.integer :bottle_count
      w.integer :user_id
    end
  end
end
