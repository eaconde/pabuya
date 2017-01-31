class CatalogTypesController < ApplicationController
  before_action :set_catalog_type, only: [:show, :edit, :update, :destroy]

  # GET /catalog_types
  # GET /catalog_types.json
  def index
    @catalog_types = CatalogType.all
  end

  # GET /catalog_types/1
  # GET /catalog_types/1.json
  def show
  end

  # GET /catalog_types/new
  def new
    @catalog_type = CatalogType.new
  end

  # GET /catalog_types/1/edit
  def edit
  end

  # POST /catalog_types
  # POST /catalog_types.json
  def create
    @catalog_type = CatalogType.new(catalog_type_params)

    respond_to do |format|
      if @catalog_type.save
        format.html { redirect_to @catalog_type, notice: 'Catalog type was successfully created.' }
        format.json { render :show, status: :created, location: @catalog_type }
      else
        format.html { render :new }
        format.json { render json: @catalog_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catalog_types/1
  # PATCH/PUT /catalog_types/1.json
  def update
    respond_to do |format|
      if @catalog_type.update(catalog_type_params)
        format.html { redirect_to @catalog_type, notice: 'Catalog type was successfully updated.' }
        format.json { render :show, status: :ok, location: @catalog_type }
      else
        format.html { render :edit }
        format.json { render json: @catalog_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalog_types/1
  # DELETE /catalog_types/1.json
  def destroy
    @catalog_type.destroy
    respond_to do |format|
      format.html { redirect_to catalog_types_url, notice: 'Catalog type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalog_type
      @catalog_type = CatalogType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catalog_type_params
      params.require(:catalog_type).permit(:name)
    end
end
