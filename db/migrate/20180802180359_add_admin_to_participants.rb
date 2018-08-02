class AddAdminToParticipants < ActiveRecord::Migration[5.2]
  def change
    add_column :participants, :admin, :boolean, default: false
  end
end
