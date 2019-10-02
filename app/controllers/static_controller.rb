class StaticController < ApplicationController
  def privacy
    filename = "privacy_policy"
    if FileTest.exist?("#{Rails.root}/public/#{filename}.html")
      stat = File::stat("#{Rails.root}/public/#{filename}.html")
      response.headers['Last-Modified'] = stat.mtime.gmtime.strftime("%a, %d %b %Y %H:%M:%S JST")
      render file: "/public/#{filename}.html", status: 200, layout: false
      return
    end
    GeneratePageJob.perform_later("#{filename}")
  end

  def not_found
    filename = "404"
    if FileTest.exist?("#{Rails.root}/public/#{filename}.html")
      stat = File::stat("#{Rails.root}/public/#{filename}.html")
      response.headers['Last-Modified'] = stat.mtime.gmtime.strftime("%a, %d %b %Y %H:%M:%S JST")
      render file: "/public/#{filename}.html", status: 404, layout: false
      return
    end
    GeneratePageJob.perform_later("#{filename}")
  end

  def server_error
    filename = "500"
    if FileTest.exist?("#{Rails.root}/public/#{filename}.html")
      stat = File::stat("#{Rails.root}/public/#{filename}.html")
      response.headers['Last-Modified'] = stat.mtime.gmtime.strftime("%a, %d %b %Y %H:%M:%S JST")
      render file: "/public/#{filename}.html", status: 500, layout: false
      return
    end
    GeneratePageJob.perform_later("#{filename}")
  end

  def bad_gateway
    filename = "502"
    if FileTest.exist?("#{Rails.root}/public/#{filename}.html")
      stat = File::stat("#{Rails.root}/public/#{filename}.html")
      response.headers['Last-Modified'] = stat.mtime.gmtime.strftime("%a, %d %b %Y %H:%M:%S JST")
      render file: "/public/#{filename}.html", status: 502, layout: false
      return
    end
    GeneratePageJob.perform_later("#{filename}")
  end
end
