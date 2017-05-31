class User < ApplicationRecord
  has_one :child
  # accepts_nested_attributes_for :child
  validates :name, presence:true, uniqueness: true, length: { minimum: 4 }
  validates :password, length: { in: 6..20 }
  validates :password_confirmation, presence: true

  has_secure_password

  def child_attributes=(attributes)
    if child #if edit form is created
      child.update(attributes)
    else
      self.child = Child.new(attributes)
    end
  end

end
