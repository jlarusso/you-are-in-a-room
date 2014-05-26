class Item < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  has_many :verbs

  acts_as_savable :owner_id, :owner_type

  # Return an item or nil
  def self.find_local(name)
    items = Player.first.items + Player.first.node.items
    items.find { |item| item.name == name }
  end

  # Return text if legal action or nil otherwise
  def action(verb_name)
    case verb_name
    when 'look' then description
    when 'get' then get
    when 'drop' then drop
    else
      verb = Verb.find_by(name: verb_name)
      if verbs.include? verb
        Action.send(verb.action)
        verb.output_text
      else
        "You can't do that"
      end
    end
  end

  def get
    if gettable
      self.owner = Player.first
      "You got the #{self.name}"
    else
      "You can't get that"
    end
  end

  def drop
    if gettable
      self.owner = Player.first.node
      "You dropped the #{self.name}"
    else
      "You can't drop that"
    end
  end
end
