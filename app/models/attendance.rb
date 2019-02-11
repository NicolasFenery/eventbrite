class Attendance < ApplicationRecord

  after_create :new_participant

  belongs_to :guest, class_name: "User"
  belongs_to :event

  def new_participant
    AttendanceMailer.new_participant_email(self).deliver_now
  end
end
