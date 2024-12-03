module ApplicationHelper
  def auto_link_text(text)
    text.gsub(URI.regexp(['http', 'https'])) do |match|
      "<a href='#{match}' target='_blank'>#{match}</a>"
    end.html_safe
  end

  def add_discontinued_class(record, options = {})
    css_class = record.discontinued_at ? 'deactivated' : ''
    options[:class] = [options[:class], css_class].compact.join(' ')
    options
  end

end
