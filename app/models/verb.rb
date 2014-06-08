class Verb < ActiveRecord::Base
  belongs_to :item
  belongs_to :node
end
