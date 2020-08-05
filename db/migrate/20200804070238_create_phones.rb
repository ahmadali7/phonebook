class CreatePhones < ActiveRecord::Migration[6.0]
  def change
    create_table :phones do |t|
      t.string :name
      t.string :phone_number
      t.text :remarks

      t.timestamps
    end
  end
end
