class Shift < ApplicationRecord
  belongs_to :activity

  def get_shifts_by_branch_activity_since_until(activity_id, f_since, f_until)
    conditions = {}
    conditions.merge!(activity_id: activity_id) if activity_id.present?
    conditions.merge!(:fecha => Date.parse(f_since)..Date.parse(f_until)) if f_since.present? && f_until.present?

    Shift.where(conditions)
  end
end
