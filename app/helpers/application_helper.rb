module ApplicationHelper
  # Time is in minutes
  def format_minutes(time)
    minutes = time % 60
    hour = (time - minutes) / 60
    str = if hour > 1
            "#{hour} hours "
          elsif hour.zero?
            ''
          else
            "#{hour} hour "
          end
    str += if minutes > 1
             "#{minutes} minutes"
           elsif minutes.zero?
             ''
           else
             "#{minutes} minute"
           end
    str.strip
  end
end
