class Node < ActiveRecord::Base
  has_many :from_edges, foreign_key: "to_id", class_name: "Edge"
  has_many :from_nodes, through: :from_edges
  has_many :to_edges, foreign_key: "from_id", class_name: "Edge"
  has_many :to_nodes, through: :to_edges
  has_one :player
  has_many :items, as: :owner

  def connect(node)
    to_nodes << node
    from_nodes << node
  end

  def find_neighbor(name)
    t = Node.arel_table
    to_node = Node.where(t[:name].matches("%#{name}")).first
    to_node if to_nodes.include?(to_node)
  end

  def items_list
    if items.empty?
      ""
    else
      "There are some items here: #{items.map(&:name).join(', ')}"
    end
  end

  def room_description
    [name, description, surroundings, items_list]
  end
end

