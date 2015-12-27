class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  has_secure_password
  
  has_one :profile, dependent: :destroy

  has_many :todo_lists, dependent: :destroy

  has_many :todo_items, through: :todo_lists, source: :todo_items

  validates :username, presence: true, length: { maximum: 50}

  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255}, 
                               format: { with: VALID_EMAIL_REGEX },
                               uniqueness: { case_sensitive: false }
  
  
  validates :password, presence: true, length: { minimum: 6 }
  # ??? add validates password_confrimation == password ???
  
  # Counter of colpeted tasks
  def get_completed_count
    TodoItem.where(completed: true).count
  end
  
  # Work with token
  def User.new_remember_token
    # create new token
    SecureRandom.urlsafe_base64
  end
  
  def User.encrypt(token)
    # encrypt token by hash
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end





