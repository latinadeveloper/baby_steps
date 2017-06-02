class Child < ApplicationRecord
  belongs_to :user
  has_many :child_skills
  accepts_nested_attributes_for :child_skills
  
  validates :child_name, presence:true, length: { minimum: 2 }
  validates :age, presence:true
end
