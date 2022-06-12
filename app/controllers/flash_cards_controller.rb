class FlashCardsController < ApplicationController
  before_action :set_flash_card, only: [:show, :edit, :update, :destroy]

  def index
    @flash_cards = FlashCard.all
  end

  def show; end

  def new
    @flash_card = FlashCard.new
  end

  def create
    @flash_card = FlashCard.new(flash_card_params)

    if @flash_card.save
      flash[:success] = "Flash card created successfully!"
      redirect_to flash_cards_path
    else
      flash[:error] = "Flash card creation failed!"
      render :new
    end
  end

  def edit; end

  def update
    if @flash_card.update(flash_card_params)
      flash[:success] = "Flash card updated successfully!"
      redirect_to flash_cards_path
    else
      flash[:error] = "Flash card update failed!"
      render :edit
    end
  end

  def destroy
    if @flash_card.destroy
      flash[:success] = "Flash card deleted successfully!"
      redirect_to flash_cards_path
    else
      flash[:error] = "Flash card deletion failed!"
      render :index
    end
  end

  private

  def set_flash_card
    @flash_card = FlashCard.find(params[:id])
  end

  def flash_card_params
    params.require(:flash_card).permit(:title, :text, :context, :pronunciation, :active)
  end
end
