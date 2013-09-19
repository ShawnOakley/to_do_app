class User < ActiveRecord::Base
  attr_accessible :name

  has_many(
  :team_lists,
  class_name: "TeamMembership",
  foreign_key: :user_id,
  primary_key: :id
  )

  has_many(
  :teams,
  through: :team_lists,
  source: :team
  )

end
