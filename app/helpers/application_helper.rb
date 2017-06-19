module ApplicationHelper
  def full_url(url)
    if url.downcase.start_with? "http"
      url
    else
      "http://#{url}"
    end
  end
end
