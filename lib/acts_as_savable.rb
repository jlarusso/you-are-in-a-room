module ActsAsSavable
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    def acts_as_savable(*fields)
    end
  end
end

ActiveRecord::Base.send :include, ActsAsSavable
