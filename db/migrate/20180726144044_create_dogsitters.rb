class CreateDogsitters < ActiveRecord::Migration[5.2]
  def change
    create_table :dogsitters do |t|
      t.references :city, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
