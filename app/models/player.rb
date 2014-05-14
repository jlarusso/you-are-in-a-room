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
      #TODO: hanlde this
      puts "Cant move there"
    end
  end
end
