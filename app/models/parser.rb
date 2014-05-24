class Parser
  def self.parse(str)
    node = Player.first.node

    case str
    when 'look'
      [node.description, node.surroundings]
    else
      ["That doesn't make sense."]
    end
  end
end
