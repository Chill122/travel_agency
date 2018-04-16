class Place < ActiveRecord::Base
    has_many :accommodations
    belongs_to :country
end
