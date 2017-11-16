class Shift < ApplicationRecord
  belongs_to :activity

  def get_shifts_by_branch_activity_since_until(activity_id, f_since, f_until)
    conditions = {}
    conditions.merge!(activity_id: activity_id) if activity_id.present?
    conditions.merge!(:fecha => Date.parse(f_since).beginning_of_day..Date.parse(f_until).end_of_day) if f_since.present? && f_until.present?

    Shift.where(conditions)
  end

  def disponibilidad    
    activity.cupo - UserShift.where("shift_id = ?", id).count
  end

  def available?
    disponibilidad > 0
  end

  def available_for_user(user_id)
    available? && !UserShift.where("shift_id = ? AND user_id = ?", id, user_id).any?
  end

  def order_by_fecha_hora
    order('fecha, hora_inicio')
  end
end
