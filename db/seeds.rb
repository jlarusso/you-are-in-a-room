Node.destroy_all
Edge.destroy_all

n1 = Node.create(name: 'Back of the room')
n2 = Node.create(name: 'Front of the room')
n3 = Node.create(name: 'Elevators')
n4 = Node.create(name: 'Service elevator')
n5 = Node.create(name: 'Kitchen')
n6 = Node.create(name: 'Phone booth')

n1.connect n2
n1.connect n4
n2.connect n5
n2.connect n3
n3.connect n6

Player.create(node_id: n1.id)

# TODO: ensure that item names are always downcase
i = Item.create(name: "box of cookies")
i.owner = n5
i.save

