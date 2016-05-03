class MyfilesController < ApplicationController
  before_action :set_myfile, only: [:show, :edit, :update, :destroy]

  # GET /myfiles
  # GET /myfiles.json
  def index
    redirect_to controller: :mydirectories, action: :index
  end

  # GET /myfiles/1
  # GET /myfiles/1.json
  def show
  end

  # GET /myfiles/new
  def new
    @myfile = Myfile.new(mydirectory_id: params[:mydirectory_id])
  end

  # GET /myfiles/1/edit
  def edit
  end

  # POST /myfiles
  # POST /myfiles.json
  def create
    @myfile = Myfile.new(myfile_params)

    respond_to do |format|
      if @myfile.save
        format.html { redirect_to (@myfile.mydirectory ? @myfile.mydirectory : :root_path), notice: 'Myfile was successfully created.' }
        format.json { render :show, status: :created, location: @myfile }
      else
        format.html { render :new }
        format.json { render json: @myfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /myfiles/1
  # PATCH/PUT /myfiles/1.json
  def update
    respond_to do |format|
      if @myfile.update(myfile_params)
        format.html { redirect_to @myfile.mydirectory, notice: 'Myfile was successfully updated.' }
        format.json { render :show, status: :ok, location: @myfile }
      else
        format.html { render :edit }
        format.json { render json: @myfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /myfiles/1
  # DELETE /myfiles/1.json
  def destroy
    @myfile.destroy
    respond_to do |format|
      format.html { redirect_to myfiles_url, notice: 'Myfile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_myfile
      @myfile = Myfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def myfile_params
      params.require(:myfile).permit(:name, :mydirectory_id)
    end
end
