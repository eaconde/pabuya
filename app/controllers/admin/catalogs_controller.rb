class Admin::CatalogsController < AdminController
  before_action :set_catalog, only: [:show, :edit, :update, :destroy]

  # GET /catalogs
  # GET /catalogs.json
  def index
    @catalogs = Catalog.all
  end

  # GET /catalogs/1
  # GET /catalogs/1.json
  def show
  end

  # GET /catalogs/new
  def new
    @catalog = Catalog.new
  end

  # GET /catalogs/1/edit
  def edit
  end

  # POST /catalogs
  # POST /catalogs.json
  def create
    @catalog = Catalog.new(catalog_params)

    respond_to do |format|
      if @catalog.save
        format.html { redirect_to admin_catalogs_url, notice: 'Catalog was successfully created.' }
        format.json { render :show, status: :created, location: @catalog }
      else
        format.html { render :new }
        format.json { render json: @catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catalogs/1
  # PATCH/PUT /catalogs/1.json
  def update
    respond_to do |format|
      if @catalog.update(catalog_params)
        format.html { redirect_to admin_catalogs_url, notice: 'Catalog was successfully updated.' }
        format.json { render :show, status: :ok, location: @catalog }
      else
        format.html { render :edit }
        format.json { render json: @catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalogs/1
  # DELETE /catalogs/1.json
  def destroy
    @catalog.destroy
    respond_to do |format|
      format.html { redirect_to admin_catalogs_url, notice: 'Catalog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalog
      @catalog = Catalog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catalog_params
      params.require(:catalog).permit(:name, :description, :points, :categories_id)
    end
end
