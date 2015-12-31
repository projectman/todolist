class TodoList < ActiveRecord::Base
  belongs_to :user
  
  has_many :todo_items, dependent: :destroy
  
  # show by create_at order
  default_scope { order :created_at}

  validates :list_name, presence: true
end
