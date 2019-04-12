class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :occupation
      t.string :department
      t.string :gender
      t.references :event, index: true
      t.timestamps
    end
    SystemSetting.create  occupation:  'other',
                          department: 'other',
                          gender: 'other'
  end
end
