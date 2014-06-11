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
    when 'inspect' then verb_list
    else
      verb = Verb.find_by(name: verb_name)
      if verbs.include? verb
        action = Action.send(verb.action, verb.id) if verb.action
        if action && action.is_a?(String)
          "#{action}<br />#{verb.output_text}"
        else
          verb.output_text
        end
      else
        "You can't do that"
      end
    end
  end

  def get
    if gettable
      self.owner = Player.first
      self.save
      "You got the #{self.name}"
    else
      "You can't get that"
    end
  end

  def drop
    if gettable
      self.owner = Player.first.node
      self.save
      "You dropped the #{self.name}"
    else
      "You can't drop that"
    end
  end

  def verb_list
    verb_list = []

    if gettable
      verb_list.push('get', 'drop')
    end

    unless verbs.empty?
      verbs.each do |verb|
        verb_list << verb.name
      end
    end

    unless verb_list.empty?
      "You can do these things to the #{name}: #{verb_list.join(' ')}"
    else
      "There isn't anything you can do to that #{name}"
    end
  end
end
