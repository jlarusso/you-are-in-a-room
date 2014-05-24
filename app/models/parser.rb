class Parser
  def self.parse(str)
    node = Player.first.node
    tokens = str.to_s.split(' ')

    # No command
    if tokens.empty?
      ["Please enter a command."]
    elsif tokens.size == 1
      token = tokens[0]

      # Plain look
      if token == 'look'
        [node.description, node.surroundings]
      else
        ["That doesn't make sense."]
      end
    else
      verb = tokens.shift
      subject = tokens.join(' ')
      item = Item.find_local(subject)

      # Action on an item or node
      if item
        legal_action = item.action(verb)
        legal_action ? [legal_action] : ["You can't do that"]
      else
        ["You don't see that here"]
      end
    end
  end
end
