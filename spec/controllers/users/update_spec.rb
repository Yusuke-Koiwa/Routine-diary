require 'rails_helper'
describe UsersController do
  let(:user) { create(:user, name: "old_name") }
  let(:other) { create(:user, name: "old_name") }

  describe '#update' do
    context 'ログインしている場合' do
      before do
        login user
      end

      context "自身のユーザー情報を更新する場合" do
        it 'userを更新する' do
          params = { id: user.id, user: { name: "new_name" } }
          patch :update, params: params
          expect(user.reload.name).to eq("new_name")
        end
        it 'マイページにリダイレクトする' do
          params = { id: user.id, user: { name: "new_name" } }
          patch :update, params: params
          expect(response).to redirect_to(user_path(user))
        end
      end

      context '他ユーザーの情報を更新しようとした場合' do
        it 'userを更新しない' do
          params = { id: other.id, user: { name: "new_name" } }
          patch :update, params: params
          expect(user.reload.name).to eq("old_name")
        end
        it 'ユーザー詳細ページにリダイレクトする' do
          params = { id: other.id, user: { name: "new_name" } }
          patch :update, params: params
          expect(response).to redirect_to(user_path(other))
        end
      end
    end

    context 'ログインしていない場合' do
      it 'userを更新しない' do
        params = { id: user.id, user: { name: "new_name" } }
        patch :update, params: params
        expect(user.reload.name).to eq("old_name")
      end
      it 'ログインページにリダイレクトする' do
        params = { id: user.id, user: { name: "new_name" } }
        patch :update, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
