class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string  :restaurant_name
      t.string  :cuisine
      t.text    :address
      t.string  :restaurant_city
      t.string  :restaurant_country
      t.integer :rating
      t.string  :restaurant_profile_img_url

      t.timestamps
    end
  end
end
