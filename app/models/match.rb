class Match < ApplicationRecord
    validates_presence_of :opponent, :location, :score
end
