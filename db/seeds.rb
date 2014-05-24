# seeds.rb
puts ""

# Nodes
nodes_path = Rails.root.join('db','seeds','nodes.yml')
puts "-> Creating nodes"
File.open(nodes_path) do |file|
  YAML.load_documents(file) do |hash|
    hash.keys.sort.each do |id|
      params = hash[id]
      Node.create(id: id, name: params['name'])
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
  YAML.load_documents(file).each do |item|
    Item.create(item)
  end
end

puts ""
