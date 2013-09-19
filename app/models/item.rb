class Item < ActiveRecord::Base
  attr_accessible :title, :description, :project_id

  belongs_to(
  :project,
  class_name: "Project",
  foreign_key: :project_id,
  primary_key: :id
  )

end
