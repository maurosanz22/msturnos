class Shift < ApplicationRecord
  belongs_to :activity

  def get_all_branchs
    branches.all
  end

  def get_all_activities
    activities = []
    get_all_branchs.each do |b|
      b.activities.all.each do |a|
        activities << a
      end
    end

    return activities
  end

  def get_all_shifts
  	shifts = []
    get_all_activities.each do |b|
      b.shifts.all.each do |a|
        shifts << a
      end
    end

    return shifts
  end
end
