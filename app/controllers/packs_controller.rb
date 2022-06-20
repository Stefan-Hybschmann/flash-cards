class PacksController < ApplicationController
  before_action :set_pack, only: [:show, :edit, :update, :destroy]

  def index
    @packs = Pack.all.order(title: :asc)
  end

  def show
    @mind_cards = @pack.mind_cards.order(title: :asc)
  end

  def new
    @pack = Pack.new
  end
  
  def create
    @pack = Pack.new(pack_params)
    
    if @pack.save
      flash[:success] = "Pack created successfully!"
      redirect_to pack_path(@pack)
    else
      flash[:error] = @pack.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit; end

  def update
    if @pack.update(pack_params)
      flash[:success] = 'Pack updated successfully!'
      redirect_to pack_path(@pack)
    else
      flash[:error] = @pack.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @pack.destroy
      flash[:success] = "Pack deleted successfully!"
    else
      flash[:error] = @pack.errors.full_messages.to_sentence
    end
    redirect_to packs_path
  end
  
  private

  def set_pack
    @pack = Pack.find(params[:id])
  end

  def set_params
    params.require(:pack).permit(:title, :description, :active)
  end
end
