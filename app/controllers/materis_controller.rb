class MaterisController < ApplicationController
	acts_as_token_authentication_handler_for User, except: [:index, :show]
  before_action :set_kelas
  before_action :set_materi, only: [:show, :update, :destroy]

  # GET /materis
  # GET /materis.json
  def index
    @materis = @kelas.materis
  end

  # GET /materis/1
  # GET /materis/1.json
  def show
  end

  # POST /materis
  # POST /materis.json
  def create
    @materi = @kelas.materis.build(materi_params.merge!(user_id: current_user.id))

    if @materi.save
      render :show, status: :created, location: @materi
    else
      render json: @materi.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /materis/1
  # PATCH/PUT /materis/1.json
  def update
    if @materi.update(materi_params)
      render :show, status: :ok, location: @materi
    else
      render json: @materi.errors, status: :unprocessable_entity
    end
  end

  # DELETE /materis/1
  # DELETE /materis/1.json
  def destroy
    @materi.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kelas
      @kelas = Kelas.find(params[:kelas_id])
    end

    def set_materi
      @materi = @kelas.materis.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def materi_params
      params.require(:materi).permit(:title, :file, :description, :user_id, :kelas_id)
    end
end
