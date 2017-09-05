class CommentsController < ApplicationController
	acts_as_token_authentication_handler_for User, except: [:index, :show]
  before_action :set_kelas

  def index
    @comments = @kelas.root_comments
  end

  def show
    @comment = @kelas.comment_threads.find(params[:id])
  end

  def create
    @comment = Comment.build_from(@kelas, current_user.id, body)
    if @comment.save
      make_child_comment
      set_title
      render :show, status: :created
    else
      render json: @coomment.errors, status: :unprocessable_entity
    end
  end

  def update
    
  end

  def destroy
    @comment = Commend.find(params[:id])
    @comment.destroy
  end
  
  private
    def set_kelas
      @kelas = Kelas.find(params[:kelas_id])
    end
    
    def comment_params
      params.require(:comment).permit(:title, :body, :comment_id)
    end

    def title
      comment_params[:title]
    end

    def comment_id
      comment_params[:comment_id]
    end

    def body
      comment_params[:body]
    end
    
    def set_title
      return "" if title.blank?
      @comment.title = title
      @comment.save
    end

    def make_child_comment
      return "" if comment_id.blank?
      parent_comment = Comment.find comment_id
      @comment.move_to_child_of(parent_comment)
    end
end
