module TasksHelper

  def handle_deadline(deadline)
    day = (deadline - Date.today).to_i
    if day > 0
      return pluralize(day, "day")
    elsif day == 0
      return "TODAY"
    else
      return "OVERDUE"
    end
  end
end
