module BrainCandiesHelper
  def brain_candy_photo
    image_tag @brain_candy.photo_url(:medium) if @brain_candy.photo.present?
  end

  def show_candy_status(status)
    {unsolved: "", solved: "Solved", claimed: "Claimed"}[status]
  end
end
