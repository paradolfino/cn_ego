class Participant < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 30 }
    validates :points, presence: true
    validates_numericality_of :points, only_integer: true
    
    def should_generate_new_friendly_id?
       slug.blank? || name_changed?
    end
end
