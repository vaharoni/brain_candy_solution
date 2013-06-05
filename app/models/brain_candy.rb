class BrainCandy < ActiveRecord::Base
  attr_accessible :name, :difficulty_level_id, :photo

  belongs_to :difficulty_level
  has_many :brain_candy_completions

  delegate :name, to: :difficulty_level, prefix: true, allow_nil: true
  delegate :url, to: :photo, prefix: true, allow_nil: true

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false
end
