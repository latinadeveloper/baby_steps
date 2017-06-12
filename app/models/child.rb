class Child < ApplicationRecord
  belongs_to :user
  has_many :accomplishments
  has_many :skills, through: :accomplishments

  accepts_nested_attributes_for :accomplishments, reject_if: :reject_accomplishments

  def reject_accomplishments(attributes)
    attributes[:id].blank? && attributes[:comment].blank? && attributes[:perform]=='0'
  end

  validates :child_name, presence:true, length: { minimum: 2 }
  validates :age, presence:true
end
