class User < ActiveRecord::Base
  before_save { email.downcase! }

  has_secure_password
  
  has_one :profile, dependent: :destroy

  has_many :todo_lists, dependent: :destroy

  has_many :todo_items, through: :todo_lists, source: :todo_items

  validates :username, presence: true, length: { maximum: 50}

  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255}, 
                               format: { with: VALID_EMAIL_REGEX },
                               uniqueness: { case_sensitive: false }
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
  def get_completed_count
    TodoItem.where(completed: true).count
  end
end
