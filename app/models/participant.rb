class Participant < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 30 }
end
