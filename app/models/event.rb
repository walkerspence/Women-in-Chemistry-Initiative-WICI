class Event < ApplicationRecord
  has_many :guests, dependent: :destroy
  # attr_accessor :name, :description, :date, :location, :tickets
  def self.past_events
    Event.where("date < ?", Date.current).order(date: :desc)
  end
  def self.future_events
    Event.where("date > ?", Date.current).order(:date)
  end
end
