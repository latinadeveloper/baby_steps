class Accomplishment < ApplicationRecord
  belongs_to :child
  belongs_to :skill

  def self.recent_skills
    order(updated_at: :desc).limit(5)
  end

end
