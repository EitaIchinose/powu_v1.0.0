class Event < ApplicationRecord
  belongs_to :user
  belongs_to :department

  with_options presence: true do
    validates :title
    validates :start_time
    validates :end_time
  end

  validate :start_time_before_end_time # 開始時間は終了時間よりも前であること
  
  private

  def start_time_before_end_time
    return unless start_time && end_time

    if start_time >= end_time
      errors.add(:start_time, 'は終了時間よりも前に設定してください')
    end
  end
end
