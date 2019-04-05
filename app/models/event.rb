class Event < ApplicationRecord
  # attr_accessor :name, :description, :date, :location, :tickets
  validates :name, :date, :location, :tickets, presence: true
  def self.past_events
    Event.where("date < ?", Date.current).order(date: :desc)
  end
  def self.future_events
    Event.where("date > ?", Date.current).order(:date)
  end
end
