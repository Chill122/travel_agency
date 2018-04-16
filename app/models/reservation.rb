class Reservation < ActiveRecord::Base
    belongs_to :user
    belongs_to :offer
    validates :persons, presence: true
end
