class TeamMembership < ActiveRecord::Base
  attr_accessible :team_id, :user_id

  belongs_to(
  :team,
  class_name: "Team",
  foreign_key: :team_id,
  primary_key: :id
  )

  belongs_to(
  :user,
  class_name: "User",
  foreign_key: :user_id,
  primary_key: :id
  )

end
