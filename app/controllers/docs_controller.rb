class DocsController < ApplicationController
  def index
    @docs = Doc.all.page(params[:page]).per(10)
  end

  def show
    if FileTest.exist?("#{Rails.root}/public/docs/#{params[:filename]}.html")
      stat = File::stat("#{Rails.root}/public/docs/#{params[:filename]}.html")
      response.headers['Last-Modified'] = stat.mtime.gmtime.strftime("%a, %d %b %Y %H:%M:%S JST")
      render file: '/public/docs/#{params[:filename]}.html', status: 200, layout: false
      return
    end
    @doc = Doc.find_by(filename: params[:filename])
  end
end
