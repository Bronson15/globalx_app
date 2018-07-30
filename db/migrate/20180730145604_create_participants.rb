class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.date   :birthdate

      t.timestamps
    end
  end
end
