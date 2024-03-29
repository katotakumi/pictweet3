require 'rails_helper'

describe TweetsController, type: :controller do

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new

    end
  end

  describe 'GET #edit' do
    tweet = create(:tweet)
    get :edit, params: { id: tweet }
    expect(assigns(:tweet)).to eq tweet
    # TODO editアクションのテストコードはまだ未完成
    end

    it "renders the :edit template" do
    end
  end

  describe 'GET #index' do
    it "populates an array of tweets ordered by created_at DESC" do
      tweets = create_list(:tweet, 3)
      get :index
      expect(assigns(:tweets)).to match(tweets.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

end
