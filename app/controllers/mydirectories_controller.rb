class MydirectoriesController < ApplicationController
  before_action :set_mydirectory, only: [:show, :edit, :update, :destroy]

  # GET /mydirectories
  # GET /mydirectories.json
  def index
    @mydirectories = Mydirectory.where(mydirectory_id: nil)
	@myfiles = Myfile.where(mydirectory_id: nil)
	unless @mydirectories.any? or @myfiles.any?
	  redirect_to action: :new
	end
  end

  # GET /mydirectories/1
  # GET /mydirectories/1.json
  def show
    @mydirectory = Mydirectory.includes(:myfiles, :mydirectory).find(params[:id])
  end

  # GET /mydirectories/new
  def new
    @mydirectory = Mydirectory.new(mydirectory_id: params[:mydirectory_id])
  end

  # GET /mydirectories/1/edit
  def edit
  end

  # POST /mydirectories
  # POST /mydirectories.json
  def create
    @mydirectory = Mydirectory.new(mydirectory_params)

    respond_to do |format|
      if @mydirectory.save
        format.html { redirect_to @mydirectory, notice: 'Mydirectory was successfully created.' }
        format.json { render :show, status: :created, location: @mydirectory }
      else
        format.html { render :new }
        format.json { render json: @mydirectory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mydirectories/1
  # PATCH/PUT /mydirectories/1.json
  def update
    respond_to do |format|
      if @mydirectory.update(mydirectory_params)
        format.html { redirect_to @mydirectory.mydirectory, notice: 'Mydirectory was successfully updated.' }
        format.json { render :show, status: :ok, location: @mydirectory }
      else
        format.html { render :edit }
        format.json { render json: @mydirectory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mydirectories/1
  # DELETE /mydirectories/1.json
  def destroy
    @mydirectory.destroy
    respond_to do |format|
      format.html { redirect_to mydirectories_url, notice: 'Mydirectory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mydirectory
      @mydirectory = Mydirectory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mydirectory_params
      params.require(:mydirectory).permit(:name, :mydirectory_id)
    end
	
	def set_root
	  @root = Mydirectory.find(params[:id] ? params[:id] : 1)
    end 
end
