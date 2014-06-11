# you-are-in-a-room

### what is a text-adventure game?

### rooms -> directed graph
- node self join through edge

### player
- challenge: general (`player.move_to`) vs specific (increment, visit count, etc.)

### items and inventory
- item polymorphic owner

### user interface
- parser (token conventions, 'always' verbs like `move`, `look`, and `get`)
- `player.move_to`

### actions on an item directed from parser

### scripting
- verbs can belong to a node or an item (possibly both simultaneously)
