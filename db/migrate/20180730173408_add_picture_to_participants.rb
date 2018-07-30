class AddPictureToParticipants < ActiveRecord::Migration[5.2]
  def change
    add_column :participants, :picture, :string
  end
end
