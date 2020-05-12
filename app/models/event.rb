class Event < ApplicationRecord
	has_many :attendances 
	has_many :users, through: :attendances

	validates :start_date, presence: true
    validate :must_start_from_now
    validates :duration, presence: true
    validate :duration_positive
    validate :duration_multiple_of_5
    validates :title, presence: true, length: { in: 5..140 }
    validates :description, presence: true, length: { in: 20..1000 }
    validates :price, presence: true, inclusion: { in: 1..1000 }
    validates :location, presence: true


    def must_start_from_now
        return unless start_date 
        errors.add(:start_date, "Merci de choisir une date futur") unless start_date > Time.now
    end

    def duration_positive
        return unless duration
        error.add(:duration, "Merci de choisir une durée supérieure à 0") unless duration > 0 
    end

    def duration_multiple_of_5
        return unless duration
        error.add(:duration, "Merci de choisir une durée multiple de 5") unless (duration % 5) == 0
    end
end
