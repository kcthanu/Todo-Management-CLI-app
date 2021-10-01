require "date"
require 'active_record'

class Todo < ActiveRecord::Base
  
  def overdue?
    due_date < Date.today
  end
  
  def due_today?
    due_date == Date.today
  end
  
  def due_later?
    due_date > Date.today
  end

  def to_displayable_string
    display_id = id
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{display_id}.  #{display_status} #{todo_text} #{display_date}"
  end

  def self.show_list
    all.map {|todo| todo.to_displayable_string }
  end
  
  def self.add_task(h)
    Todo.create!(todo_text: h[:todo_text], due_date: Date.today + h[:due_in_days], completed: false)
  end
  
  def self.mark_as_complete(todo_id)
     Todo.where("id = ?", todo_id).update({'completed': true})
  end
  
end
