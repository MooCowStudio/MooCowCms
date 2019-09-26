class Api::V1::AccessRankingController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /api/v1/access_ranking.json
  def index
    docs = get_access_ranking
    logger.info(docs.inspect)
    respond_to do |format|
      format.json {render json: docs.map{|doc| [doc.title, doc.filename, doc.image.url]}}
    end
  end

  private
    def get_access_ranking
      ids = AccessLog.group(:doc_id).order("count_all DESC").limit(5).count.keys
      docs = Doc.where(id: ids)
      ids.collect {|id| docs.detect {|x| x.id == id}}
    end
end
