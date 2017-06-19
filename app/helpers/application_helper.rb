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
end
