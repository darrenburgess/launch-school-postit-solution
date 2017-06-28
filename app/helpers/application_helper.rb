module ApplicationHelper
  def full_url(url)
    if url.downcase.start_with? "http"
      url
    else
      "http://#{url}"
    end
  end

  def friendly_date(timestamp)
    timestamp.to_formatted_s(:long)
  end

  def vote_path(obj, vote)
    klass = obj.class.name
    if klass == 'Post'
      vote_post_path(obj, vote: vote)
    elsif klass == 'Comment'
      vote_comment_path(obj, vote: vote)
    end
  end
end
