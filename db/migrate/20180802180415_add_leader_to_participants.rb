class AddLeaderToParticipants < ActiveRecord::Migration[5.2]
  def change
    add_column :participants, :leader, :boolean, default: false
  end
end
