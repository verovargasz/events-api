class Event < ApplicationRecord
  validates :name, length: { maximum: 32 }
end
