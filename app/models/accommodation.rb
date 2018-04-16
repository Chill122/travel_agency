class Accommodation < ActiveRecord::Base
    has_many :offers
    belongs_to :place
end
