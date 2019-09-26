class Api::V1::AccessLogsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_access_log, only: [:show, :edit, :update, :destroy]

  # POST /access_logs
  # POST /api/v1/access_logs.json
  def create
    @access_log = AccessLog.new(access_log_params)

    respond_to do |format|
      if @access_log.save
        format.json {}
      else
        format.json {}
      end
    end
  end

  private
    def access_log_params
      params.require(:access_log).permit(:site_id, :doc_id)
    end
end
