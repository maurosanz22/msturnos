class ShiftType < ApplicationRecord
    has_many :shifts
    belongs_to :branch
end
