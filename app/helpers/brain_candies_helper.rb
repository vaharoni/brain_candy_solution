module BrainCandiesHelper
  def brain_candy_photo
    image_tag @brain_candy.photo_url(:medium) if @brain_candy.photo.present?
  end

  def show_candy_status(status)
    label =
        {unsolved: nil,
         solved: {text: "Solved", label: "label-success"},
         claimed: {text: "Claimed", label: "label-warning"}}[status]

    return nil unless label.present?
    content_tag :span, label[:text], class: "label #{label[:label]}"
  end
end
