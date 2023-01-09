# this module provides a simple way to get an ETA for a task, given:
# - elapsed time, in seconds
# - percentage complete (Float in the range of 0.0..1.0)
module TinyEta
  SECONDS_PER_DAY = (60 * 60 * 24)
  SECONDS_PER_HOUR = (60 * 60)
  SECONDS_PER_MINUTE = 60

  # returns a string with "DDd HH:MM:SS", where:
  # - DD is the number of days
  # - HH is the number of hours
  # - MM is the number of minutes
  # - SS is the number of seconds
  #
  # NOTE: if ETA is less than a day, then DD will be excluded, whereas HH:MM:SS
  # will always be shown
  #
  # elapsed: the number of seconds elapsed (Integer or Float)
  # percent_complete: 0.0..1.0 - the percent completion (Float)
  def self.eta(elapsed, percent_complete)
    percent_remaining = (1.0 - percent_complete)
    remaining_time = ((elapsed / percent_complete) * percent_remaining).round
    puts remaining_time

    days = (remaining_time / SECONDS_PER_DAY.to_f).to_i
    remaining_time -= days * SECONDS_PER_DAY

    hours = (remaining_time / SECONDS_PER_HOUR.to_f).to_i
    remaining_time -= hours * SECONDS_PER_HOUR

    minutes = (remaining_time / SECONDS_PER_MINUTE.to_f).to_i
    remaining_time -= minutes * SECONDS_PER_MINUTE

    seconds = remaining_time

    "#{days > 0 ? "#{days}d " : ''}#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
  end
end
