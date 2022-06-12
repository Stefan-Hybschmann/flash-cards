require 'rails_helper'

RSpec.describe MindCardsController, type: :controller do
  let!(:mind_card) { create(:mind_card) }
  let!(:mind_card_list) { create_list(:mind_card, 3) }
  let!(:params) do 
    { 
      mind_card: {
        title: 'title',
        text: 'text',
        context: 'context',
        pronunciation: 'pronunciation',
        active: true,
      },
    } 
  end

  describe '#index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe '#show' do
    it "returns http success" do
      get :show, params: { id: mind_card.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe '#new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe '#create' do
    it 'creates a new mind card' do
      expect { 
        post :create, params: params
      }.to change { MindCard.count }.by(1)
    end

    it 'redirects to the mind card index' do
      post :create, params: params
      expect(response).to redirect_to(mind_cards_path)
    end

    context 'when the mind card is invalid' do
      it 'does not create a new mind card' do
        expect { 
          post :create, params: { mind_card: { title: '' } } 
        }.to change { MindCard.count }.by(0)
      end

      it 'renders the new template' do
        post :create, params: { mind_card: { title: '' } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe '#edit' do
    it "returns http success" do
      get :edit, params: { id: mind_card.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe '#update' do
    it 'updates the mind card' do
      put :update, params: { id: mind_card.id, mind_card: { title: 'new title' } }
      expect(mind_card.reload.title).to eq('new title')
    end

    context 'when the mind card is invalid' do
      it 'does not update the mind card' do
        put :update, params: { id: mind_card.id, mind_card: { title: '' } }
        expect(mind_card.reload.title).to eq('mind card title')
      end
    end
  end

  describe '#destroy' do
    it 'deletes the mind card' do
      expect { 
        delete :destroy, params: { id: mind_card.id } 
      }.to change { MindCard.count }.by(-1)
    end
  end
end
