module ApplicationHelper
  def reward_img(object)
    if object.img.attachment
      return image_tag(url_for(object.img))
    end
  end
end
