class Project < ActiveRecord::Base
  attr_accessible :title, :description, :team_id

  belongs_to(
  :team,
  class_name: "Team",
  foreign_key: :team_id,
  primary_key: :id
  )

  has_many(
  :items,
  class_name: "Item",
  foreign_key: :project_id,
  primary_key: :id
  )

end
