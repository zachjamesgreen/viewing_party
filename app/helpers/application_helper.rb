module ApplicationHelper

  # Time is in minutes
  def format_minutes(time)
    minutes = time % 60
    hour = (time - minutes) / 60
    "#{hour}:#{minutes}"
  end
end
