class Task < ApplicationRecord
  belongs_to :event
  has_many :assignments, dependent: :destroy
  has_many :volunteers, :through => :assignments
  validates :name, presence: true

  def self.all_tasks(event)
    Task.where(:event_id => event).order(deadline: :desc)
  end


  # This allows volunteers to sign up for events without a specific task.
  # We may decide to remove this later, as we can stub tasks once they are done.
  def self.get_none_task(event)
    task = Task.find_by_name_and_event_id("Nothing", event.id)
    if task.nil?
      task = Task.new(name: "Nothing", event_id: event.id)
      task.save!
    end
    task
  end

end
