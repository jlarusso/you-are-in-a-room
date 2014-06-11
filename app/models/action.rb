class Action
  def self.water_plant(verb_id)
    item = Verb.find(verb_id).item
    item.description = "A nice plant, green, and well-watered"
    item.save
  end

  def self.email_notification(verb_id)
    verb = Verb.find(verb_id)
    if verb.incremental > 0
      i = Item.create(
        name: 'email',
        owner_id: 1,
        owner_type: 'Node',
        description: 'The email is from your doctor; it is labeled urgent.',
        gettable: false
      )
      i.verbs << Verb.create(name: 'read', action: 'read_email', output_text: 'you read it')
      verb.destroy
    else
      verb.incremental += 1
      verb.save
    end
  end

  def self.read_email(verb_id)
    item = Verb.find(verb_id).item
    item.destroy
  end

  def self.phone_starts_ringing(verb_id)
    verb = Verb.find(verb_id)
    node = verb.node
    if node.visited_count >= 2
      Verb.create(
        action: 'phone_ring',
        output_text: 'Your cellphone rings loudly on your desk, turning a few heads.',
        node_id: 1,
        incremental: 1
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

  def self.answer_phone(verb_id)
    item = Verb.find(verb_id).item
    item.owner = Player.first
    item.save
  end
end
