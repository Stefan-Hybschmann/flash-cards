class MindCardsController < ApplicationController
  before_action :set_mind_card, only: [:show, :edit, :update, :destroy]

  def index
    @mind_cards = MindCard.all.order(title: :asc)
  end

  def show; end

  def new
    @mind_card = MindCard.new
  end

  def create
    @mind_card = MindCard.new(mind_card_params)
    
    if @mind_card.save
      flash[:success] = "Mind card created successfully!"
      redirect_to mind_cards_path
    else
      flash[:error] = @mind_card.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit; end

  def update
    if @mind_card.update(mind_card_params)
      flash[:success] = 'Mind card updated successfully!'
      redirect_to mind_cards_path
    else
      flash[:error] = @mind_card.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @mind_card.destroy
      flash[:success] = "Mind card deleted successfully!"
    else
      flash[:error] = @mind_card.errors.full_messages.to_sentence
    end
    redirect_to mind_cards_path
  end

  private

  def set_mind_card
    @mind_card = MindCard.find(params[:id])
  end

  def mind_card_params
    params.require(:mind_card).permit(:title, :text, :context, :pronunciation, :active)
  end
end
