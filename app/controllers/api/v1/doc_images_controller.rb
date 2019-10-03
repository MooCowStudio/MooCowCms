class Api::V1::DocImagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /api/v1/doc_images/:id.json
  def show
    doc = Doc.find(params[:id])
    respond_to do |format|
      format.json {render json: {src: doc.image.url}}
    end
  end
end
