# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

DifficultyLevel.transaction do
  DifficultyLevel.delete_all
  [:super_easy, :easy, :medium, :hard, :impossible].each_with_index do |d, i|
    DifficultyLevel.new do |dl|
      dl.id = i + 1
      dl.name = d.to_s.titleize
      dl.save!
    end
  end
end

BrainCandy.transaction do
  BrainCandy.where("id <= ?", 4).delete_all
  ["Snicker", "Twizzler", "Twix", "Jelly Belly"].each_with_index do |c, i|
    id = i + 1
    BrainCandy.new do |bc|
      bc.id = id
      bc.difficulty_level_id = id
      bc.name = c
      bc.photo_file_name = "#{c.gsub(" ", "")}.jpg"
      bc.save!
    end
  end
end