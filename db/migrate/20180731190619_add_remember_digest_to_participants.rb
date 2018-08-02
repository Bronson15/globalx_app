class AddRememberDigestToParticipants < ActiveRecord::Migration[5.2]
  def change
    add_column :participants, :remember_digest, :string
  end
end
