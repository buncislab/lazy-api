class VideosController < ApplicationController
	acts_as_token_authentication_handler_for User, except: [:index, :show]
  before_action :set_kelas
  before_action :set_video, only: [:show, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = @kelas.videos
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = @kelas.videos.build(video_params.merge!(user_id: current_user.id))

    if @video.save
      render :show, status: :created
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    if @video.update(video_params)
      render :show, status: :ok
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
  end

  private
    def set_kelas
      @kelas = Kelas.find(params[:kelas_id])
    end
  # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = @kelas.videos.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:title, :url, :description, :user_id, :kelas_id)
    end
end
