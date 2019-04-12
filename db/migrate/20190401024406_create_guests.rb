class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :occupation, default: "other"
      t.string :department, default: "other"
      t.string :gender, default: "other"
      t.references :event, index: true
      t.timestamps
    end
  end
end
