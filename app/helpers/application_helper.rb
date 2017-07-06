module ApplicationHelper
  def full_url(url)
    if url.downcase.start_with? "http"
      url
    else
      "http://#{url}"
    end
  end

  def friendly_date(dt)
    if logged_in? && !current_user.timezone.blank?
      dt = dt.in_time_zone(current_user.timezone)
    end

    dt.strftime("%m/%d/%Y %l:%M%P %Z")
  end

  def vote_path(obj, vote)
    klass = obj.class.name
    if klass == 'Post'
      vote_post_path(obj, vote: vote)
    elsif klass == 'Comment'
      vote_comment_path(obj, vote: vote)
    end
  end

  def vote_count_element_id(obj)
    "#{obj.class.name}-vote-#{obj.id}"
  end
end
