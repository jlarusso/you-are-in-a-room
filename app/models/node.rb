class Node < ActiveRecord::Base
  has_many :from_links, foreign_key: "to_id", class_name: "Edge"
  has_many :from_nodes, through: :from_links

  has_many :to_links, foreign_key: "from_id", class_name: "Edge"
  has_many :to_nodes, through: :to_links
end
