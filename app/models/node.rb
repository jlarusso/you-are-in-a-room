class Node < ActiveRecord::Base
  has_many :from_edges, foreign_key: "to_id", class_name: "Edge"
  has_many :from_nodes, through: :from_edges

  has_many :to_edges, foreign_key: "from_id", class_name: "Edge"
  has_many :to_nodes, through: :to_edges

  def connect(node)
    to_nodes << node
    from_nodes << node
  end
end

