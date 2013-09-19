class Team < ActiveRecord::Base
  attr_accessible :name

  has_many(
  :projects,
  class_name: "Project",
  foreign_key: :team_id,
  primary_key: :id
  )

  has_many(
  :membership_lists,
  class_name: "TeamMembership",
  foreign_key: :team_id,
  primary_key: :id
  )

  has_many(
  :members,
  through: :membership_lists,
  source: :user
  )

end
