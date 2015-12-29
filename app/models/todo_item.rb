class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  default_scope { order :due_date}

  # !!! validates :title, presence: true
end
