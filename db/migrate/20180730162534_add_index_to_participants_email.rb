class AddIndexToParticipantsEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :participants, :email, unique: true
  end
end
