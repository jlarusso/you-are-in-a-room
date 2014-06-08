class Player < ActiveRecord::Base
  belongs_to :node
  has_many :items, as: :owner
  has_many :flags

  acts_as_savable :node_id

  def move_to(to_node)
    if to_node.try('instance_of?', Node) && node.to_nodes.include?(to_node)
      self.node = to_node
      save!
      to_node.visited
      to_node.room_description
    end
  end

  def pick_up(item_name)
    item = self.node.items.where(name: item_name.downcase).first
    if item
      item.owner = self
      item.save!
    else
      "You cant find the #{item_name}"
    end
  end
end
