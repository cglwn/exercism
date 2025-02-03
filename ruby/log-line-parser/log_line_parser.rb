class LogLineParser
  ERROR_PREFIX = '[ERROR]: '
  WARNING_PREFIX = '[WARNING]: '
  INFO_PREFIX = '[INFO]: '

  def initialize(line)
    @line = line
  end

  def message
    @line.split(':')[1].strip
  end

  def log_level
    if @line.start_with?(ERROR_PREFIX)
      'error'
    elsif @line.start_with?(WARNING_PREFIX)
      'warning'
    elsif @line.start_with?(INFO_PREFIX)
      'info'
    end
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
