module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5.hexdigest(user.Username.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.Username, class: 'gravatar')
  end

  def current_user
    session[:current_user] ? User.find(session[:current_user]) : nil
  end

  def profile_pic
    if current_user[:Photo].nil?
      gravatar_for current_user, size: 50
    else
      image_tag current_user.Photo.thumb.url
    end
  end

  def user_pic(user)
    unless user[:Photo].nil?
      image_tag user.Photo.thumb.url
    else
        gravatar_for user, size: 50
    end
  end
end
