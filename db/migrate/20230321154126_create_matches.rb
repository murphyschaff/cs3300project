class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.text :opponent
      t.int :score
      t.text :location
      t.text :notes

      t.timestamps
    end
  end
end
