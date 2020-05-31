require 'rails_helper'
describe UsersController do
  let(:user) { create(:user) }

  describe '#show' do

    context 'ログインしている場合' do
      before do
        login user
      end
      it "@userに正しい値が入っている" do
        get :show, params: {  id: user }
        expect(assigns(:user)).to eq user
      end
      it "show.html.erbに遷移する" do
        get :show, params: {  id: user }
        expect(response).to render_template :show
      end
    end

    context 'ログインしていない場合' do
      it "ログインページにリダイレクトする" do
        get :show, params: {  id: user }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end

end