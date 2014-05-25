# seeds.rb
puts ""

# Nodes
nodes_path = Rails.root.join('db','seeds','nodes.yml')
puts "-> Creating nodes"
File.open(nodes_path) do |file|
  YAML.load_documents(file) do |hash|
    hash.keys.sort.each do |id|
      params = hash[id]
      n = Node.create(id: id)
      n.update_attributes params
    end
  end
end

# Edges
edges_path = Rails.root.join('db','seeds','edges.yml')
puts "-> Creating edges"
File.open(edges_path) do |file|
  YAML.load_documents(file).each do |connection|
    connection.each do |edge|
      Node.find(edge[0]).connect Node.find(edge[1])
    end
  end
end

# Player
puts "-> Creating player"
Player.create(id: 1, node_id: 1)

# Items
items_path = Rails.root.join('db','seeds','items.yml')
puts "-> Creating items"
File.open(items_path) do |file|
  YAML.load_documents(file).each do |hash|
    hash.keys.sort.each do |id|
      params = hash[id]
      i = Item.create(id: id)
      i.update_attributes params
    end
  end
end

# Verbs
verbs_path = Rails.root.join('db','seeds','verbs.yml')
puts "-> Creating verbs"
File.open(verbs_path) do |file|
  YAML.load_documents(file).each do |hash|
    hash.keys.sort.each do |id|
      params = hash[id]
      v = Verb.create(id: id)
      v.update_attributes params
    end
  end
end

puts ""
