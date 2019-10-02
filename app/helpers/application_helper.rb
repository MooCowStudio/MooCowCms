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

  def breadcrumb_html(crumb)
    html = ""
    home = content_tag(:li) do
      link_to("/") do
        content_tag(:span, class: "oi oi-home") do
          "HOME"
        end
      end
    end
    html << home
    if crumb.present?
      crumb.each do |c|
        c_link = content_tag(:li) do
          link_to(c[:url]) do
            content_tag(:span) do
              c[:title]
            end
          end
        end
        html << c_link
      end
    end
    html.html_safe
  end
end
