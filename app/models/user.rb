class User < ApplicationRecord
  has_many :children
  # accepts_nested_attributes_for :child
  validates :name, presence:true, uniqueness: true, length: { minimum: 2 }
  validates :password, length: { in: 6..20 }
  # validates :password_confirmation, presence: true

  has_secure_password

  def child_attributes=(attributes)
    child = children.first
    if child #if edit form is created
      child.update(attributes)
    else
      self.children << Child.new(attributes)
    end
  end

  def self.create_with_omniauth(auth)
    user = find_or_create_by(uid: auth['uid'], provider:  auth['provider'])
    # user.email = “#{auth[‘uid’]}@#{auth[‘provider’]}.com”
    user.password = auth['uid']
    user.name = auth['info']['name']
    user.save!
    user

  end


end
