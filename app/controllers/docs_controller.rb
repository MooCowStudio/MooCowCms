class DocsController < ApplicationController
  def index
    @docs = Doc.all.page(params[:page]).per(10)
  end

  def show
    @doc = Doc.find_by(filename: params[:filename])
  end
end
