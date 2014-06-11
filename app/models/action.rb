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
      i.verbs << Verb.create(name: 'read',
                             action: 'read_email',
                             output_text: "I'm sorry to be the one to bring you this information, but the results of your last test have come back conclusive. Your hallucinations are coming from an abnormal brain structure. We are frankly surprised that you are conscious at all. Please call us immediately. - Docter Graves P.S. Happy Earth Day!"
                            )
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
    # item = Verb.find(verb_id).item
    # item.owner = Player.first
    # item.save
    dial_doctor(verb_id)
  end

  def self.dial_doctor(verb_id)
    if Player.first.node.id == 6
      "A nurse answers the phone and awkwardly passes it off to the doctor. Dr. Graves informs you that you will rapidly go insane. He recommends that you do what matters to you most during the time you have left."
    else
      "It might seem rude to start a phone call in the middle of the office. Maybe there is a room that is a little more private."
    end
  end
end
