class Action
  def self.water_plant(verb_id)
    item = Verb.find(verb_id).item
    item.description = "A nice plant, green, and well-watered"
    item.save
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
