class Participant < ApplicationRecord
    require 'csv'
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 30 }
    validates :points, presence: true
    validates_numericality_of :points, only_integer: true
    
    def should_generate_new_friendly_id?
       slug.blank? || name_changed?
    end
    
    def self.import(file)
        if file
            CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
                new_row = row.to_hash.delete_if { |k, v| k.nil? }
                begin
                    Participant.create(new_row)
                rescue StandardError => e
                    puts e.message
                end

            end
        end
    end
end
