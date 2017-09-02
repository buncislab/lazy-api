class LinksController < ApplicationController
	acts_as_token_authentication_handler_for User, except: [:index, :show]
  before_action :set_kelas
  before_action :set_link, only: [:show, :update, :destroy]
  
  # GET /links
  # GET /links.json
  def index
    @links = @kelas.links
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # POST /links
  # POST /links.json
  def create
    @link = @kelas.links.build(link_params.merge!(user_id: current_user.id))

    if @link.save
      render :show, status: :created
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    if @link.update(link_params)
      render :show, status: :ok
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
  end

  private
    def set_kelas
      @kelas = Kelas.find(params[:kelas_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = @kelas.links.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:title, :url, :description, :user_id, :kelas_id)
    end
end
