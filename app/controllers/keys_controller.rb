class KeysController < ApplicationController
  def new
  end
  def index
  end
  def create
    @key = Key.new(key_params)
    # @key = Key.build_from_scale(key_params)
    @key.save
    redirect_to @key
  end
  def show
    @key = Key.find(params[:id])
  end
  private
    def key_params
      params.require(:key).permit(:scale, :root)
    end
end
