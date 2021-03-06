class Admin::DocsController < AdminController
  before_action :set_doc, only: [:show, :edit, :update, :destroy]

  # GET /docs
  # GET /docs.json
  def index
    @docs = Doc.all
  end

  # GET /docs/1
  # GET /docs/1.json
  def show
  end

  # GET /docs/new
  def new
    @doc = Doc.new
    @sites = Site.all
    @layouts = Layout.all
  end

  # GET /docs/1/edit
  def edit
    @sites = Site.all
    @layouts = Layout.all
  end

  # POST /docs
  # POST /docs.json
  def create
    @doc = Doc.new(doc_params)

    respond_to do |format|
      if @doc.save
        GeneratePageJob.perform_later("docs", @doc.id)
        format.html { redirect_to admin_doc_url(@doc), notice: 'Doc was successfully created.' }
        format.json { render :show, status: :created, location: @doc }
      else
        @sites = Site.all
        @layouts = Layout.all
        format.html { render :new }
        format.json { render json: @doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /docs/1
  # PATCH/PUT /docs/1.json
  def update
    respond_to do |format|
      if @doc.update(doc_params)
        GeneratePageJob.perform_later("docs", @doc.id)
        format.html { redirect_to admin_doc_url(@doc), notice: 'Doc was successfully updated.' }
        format.json { render :show, status: :ok, location: @doc }
      else
        @sites = Site.all
        @layouts = Layout.all
        format.html { render :edit }
        format.json { render json: @doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /docs/1
  # DELETE /docs/1.json
  def destroy
    FileUtils.rm(File.join(Rails.root, "public", "docs", "#{@doc.filename}.html")) if FileTest.exist?(File.join(Rails.root, "public", "docs", "#{@doc.filename}.html"))
    @doc.destroy
    respond_to do |format|
      format.html { redirect_to admin_docs_url, notice: 'Doc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doc
      @doc = Doc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doc_params
      params.fetch(:doc, {}).permit(:site_id, :title, :body, :filename, :layout_id, :image, :description)
    end
end
