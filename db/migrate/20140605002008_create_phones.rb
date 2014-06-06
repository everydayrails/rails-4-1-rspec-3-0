class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.references :contact, index: true
      t.string :phone
      t.string :phone_type

      t.timestamps
    end
  end
end
