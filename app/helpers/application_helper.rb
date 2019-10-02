module ApplicationHelper
  def rm_html_tag(str)
    str.sub!(/<[^<>]*>/,"") while /<[^<>]*>/ =~ str
    str
  end

  def link_to_block_if(condition, options = {}, html_options = {}, &block)
    if condition
      link_to(options, html_options, &block)
    else
      capture(&block)
    end
  end

  def full_title(page_title)
    base_title = "MooCowフラバール"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
