class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.string :opponent
      t.integer :score
      t.text :location
      t.text :notes

      t.timestamps
    end
  end
end
