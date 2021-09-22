require "date"

class Todo
  @text
  @due_date
  @completed

  def initialize(text, due_date, completed)
    @text = text
    @due_date = due_date
    @completed = completed
  end
  
  def to_displayable_string
    if @completed
        display_status = "X"
    else
        display_status = " "
    end
    if @due_date == Date.today
        display_date = ""
    else
        display_date = @due_date
    end
    puts "[#{display_status}] #{@text} #{display_date}"
  end
  
  def overdue?
    @due_date < Date.today
  end
  
  def due_today?
    @due_date == Date.today
  end
  
  def due_later?
    @due_date > Date.today
  end
end
