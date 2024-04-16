module ApplicationHelper
  def auto_link_text(text)
    text.gsub(URI.regexp(['http', 'https'])) do |match|
      "<a href='#{match}' target='_blank'>#{match}</a>"
    end.html_safe
  end
end
