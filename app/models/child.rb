class Child < ApplicationRecord
  belongs_to :user
  has_many :accomplishments
  accepts_nested_attributes_for :accomplishments,
    reject_if: :all_blank

  validates :child_name, presence:true, length: { minimum: 2 }
  validates :age, presence:true
end
