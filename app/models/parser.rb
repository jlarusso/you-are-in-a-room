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
      case token
      when 'look' then node.room_description
      when 'help' then Parser.help
      else ["That doesn't make sense."]
      end
    else
      verb = tokens.shift
      subject = tokens.join(' ')

      # Player move
      if verb == 'move'
        to_node = node.find_neighbor(subject)
        Player.first.move_to(to_node) || ["You can't move there"]
      else
        # Action on an item or node
        target = Item.find_local(subject)
        if target
          legal_action = target.action(verb)
          legal_action ? [legal_action] : ["You can't do that"]
        else
          ["You don't see that here"]
        end
      end
    end
  end

  def self.help
    [
      "Type <em>look</em> to look at the current room.",
      "Type <em>move</em> <em>room</em> to enter another room.",
      "Type a verb and then an object to take some kind of action.",
      "For example, <em>look phone</em>, will look at your phone.",
      "To get a list of actions for an item, <em>inspect</em> the item."
    ]
  end
end
