class Action
  def self.water_plant(verb_id)
    item = Verb.find(verb_id).item
    item.description = "A nice plant, green, and well-watered"
    item.save
  end

  def self.phone_starts_ringing(verb_id)
    verb = Verb.find(verb_id)
    node = verb.node
    if node.visited_count >= 2
      Verb.create(
        action: 'phone_ring',
        output_text: 'Your cellphone rings loudly on your desk, turning a few heads.',
        node_id: 1
      )
      verb.destroy
    end
  end

  def self.phone_ring(verb_id)
    verb = Verb.find(verb_id)

    # Let it ring 4 times
    if verb.incremental > 3
      verb.destroy
    else
      verb.incremental += 1
      verb.save
    end
  end
end
