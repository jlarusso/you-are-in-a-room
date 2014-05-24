class Item < ActiveRecord::Base
  belongs_to :owner, polymorphic: true

  acts_as_savable :owner_id, :owner_type

  # Return an item or nil
  def self.find_local(name)
    items = Player.first.items + Player.first.node.items
    items.find { |item| item.name == name }
  end

  # Return text if legal action or nil otherwise
  def action(verb)
    if verb == 'look'
      description
    else
      binding.pry
    end
  end
end
