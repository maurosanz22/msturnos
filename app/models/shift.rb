class Shift < ApplicationRecord
  belongs_to :shift_type
  belongs_to :activity
end
