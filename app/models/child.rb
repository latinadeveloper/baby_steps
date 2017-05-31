class Child < ApplicationRecord
  belongs_to :user
  validates :child_name, presence:true, length: { minimum: 2 }
  validates :age, presence:true
end
