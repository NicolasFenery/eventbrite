class Event < ApplicationRecord

  belongs_to :administrator, class_name: "User"
  has_many :attendances
  has_many :guests, class_name: "User", through: :attendances

  validates :start_date,
  presence: true

  validates :duration,
  presence: true,
  numericality: { greater_than: 0 }

  validates :title,
  presence: true,
  length: { minimum: 5, maximum: 140 }

  validates :description,
  presence: true,
  length: { minimum: 10, maximum: 1000 }

  validates :price,
  presence: true,
  numericality: { greater_than: 1, less_than: 1000}

  validates :location,
  presence: true


  def is_event_passed?
    errors.add(:start_date, "L'évenement est déjà fini")
    if start_date < Time.now
    end
  end

  def correct_duration
    errors.add(:duration, "Durée incorrecte")
    unless duration % 5 == 0
    end
  end
end
