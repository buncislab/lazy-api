class KelasesController < ApplicationController
  before_action :set_kelas, only: [:show, :update, :destroy]

  # GET /kelases
  # GET /kelases.json
  def index
    @kelases = Kelas.all
  end

  # GET /kelases/1
  # GET /kelases/1.json
  def show
  end

  # POST /kelases
  # POST /kelases.json
  def create
    @kelas = Kelas.create!(kelas_params)
    if @kelas.save
      render :show, status: :created, location: @kelas
    else
      render json: @kelas.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kelases/1
  # PATCH/PUT /kelases/1.json
  def update
    if @kelas.update(kelas_params)
      render :show, status: :ok, location: @kelas
    else
      render json: @kelas.errors, status: :unprocessable_entity
    end
  end

  # DELETE /kelases/1
  # DELETE /kelases/1.json
  def destroy
    @kelas.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kelas
      @kelas = Kelas.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kelas_params
      params.require(:kelas).permit(:title, :description)
    end
end
