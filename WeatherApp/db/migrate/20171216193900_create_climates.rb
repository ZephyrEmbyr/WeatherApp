class CreateClimates < ActiveRecord::Migration[5.1]
  def change
    create_table :climates do |t|
      t.string :name
      t.string :city
      t.string :zip
      t.string :temperature
      t.string :sky

      t.timestamps
    end
  end
end
