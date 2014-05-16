class Player < ActiveRecord::Base
  belongs_to :node
  has_many :items, as: :owner

  # Check if current node is connected to target node
  # Move player to target node
  def move_to(to_node)
    if node.to_nodes.include?(to_node)
      self.node = to_node
      save!
    else
      raise ActiveRecord::RecordNotFound
    end
  end

  def pick_up(item_name)
    item = self.node.items.where(name: item_name.downcase).first
    if item
      item.owner = self
      item.save
    else
      puts "You cant find the #{item_name}"
    end
  end
end
