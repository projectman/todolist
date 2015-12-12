class Profile < ActiveRecord::Base
  belongs_to :user
  
  #validates :first_name, presence: true

  validate :charge_xor_payment
 
  def charge_xor_payment
    if last_name.blank? && first_name.blank? # Here last and first names must be w/o ":"
      errors.add(:base, "Specify a charge or a payment, not both")
    end
  end

  validates :gender, inclusion: { in: %w[male female]}
  
  validate :no_sue
  def no_sue
    errors.add(:base, "Genger male can not have first_name Sue") if gender == "male" && first_name == "Sue"
  end


  # 14 task
  def self.get_all_profiles(start_year, end_year)
  	Profile.where(birth_year: start_year..end_year)
  end
  
  default_scope { order :birth_year}

end
