require 'rails_helper'
describe UsersController do
  let(:user) { create(:user) }
  let(:other) { create(:user) }

  describe '#edit' do
    context 'ログインしている場合' do
      before do
        login user
      end

      context '自身のユーザー情報を編集する場合' do
        it "@userに正しい値が入っている" do
          get :edit, params: { id: user }
          expect(assigns(:user)).to eq user
        end
        it "edit.html.erbに遷移する" do
          get :edit, params: {  id: user }
          expect(response).to render_template :edit
        end
      end

      context '他ユーザーの情報を編集しようとした場合' do
        it "ユーザー詳細ページにリダイレクトする" do
          get :edit, params: {  id: other }
          expect(response).to redirect_to(user_path(other))
        end
      end
    end

    context 'ログインしていない場合' do
      it "ログインページにリダイレクトする" do
        get :edit, params: { id: user }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end