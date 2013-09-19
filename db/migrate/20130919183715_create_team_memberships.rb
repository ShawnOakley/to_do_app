class CreateTeamMemberships < ActiveRecord::Migration
  def change
    create_table :team_memberships do |t|
      t.integer :team_id
      t.integer :user_id

      t.timestamps
    end
    add_index :team_memberships, :team_id
    add_index :team_memberships, :user_id
  end
end
