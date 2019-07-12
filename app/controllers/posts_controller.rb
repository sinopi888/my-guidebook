class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    # @post.build_country
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
      flash[:success] = "ユーザを登録しました"
      redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:title, :text, :notepoint, :country, :user_id)
    end
end
