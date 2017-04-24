class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  acts_as_list scope: :todo_list

  def completed?
    !completed_at.blank?
  end

  def moveup
    position = position + 1
  end

  def movedown
    position = position - 1
  end
end
