class BrainCandyCompletion < ActiveRecord::Base
  belongs_to :brain_candy
  belongs_to :user
  belongs_to :verifying_user
  attr_accessible :completed_at, :victory_text, :brain_candy

  def self.status(object)
    return :unsolved unless object.present?
    object.status
  end

  def status
    verifying_user_id.present? ? :solved : :claimed
  end
end
