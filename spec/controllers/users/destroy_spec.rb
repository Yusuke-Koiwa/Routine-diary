require 'rails_helper'
describe UsersController do
  let(:user) { create(:user) }
  let(:other) { create(:user) }
  let(:admin) { create(:user, admin: true) }

  describe '#destroy' do
    context 'ログインしている場合' do
      context "管理ユーザーである場合" do
        before do
          login admin
        end

        context "他ユーザーを削除する場合" do
          it 'userを削除する' do
            params = { id: user.id }
            expect do
              delete :destroy, params: params
            end.to change(User, :count).by(-1)
          end
          it 'トップページにリダイレクトする' do
            params = { id: user.id }
            delete :destroy, params: params
            expect(response).to redirect_to(root_path)
          end
        end

        context "管理ユーザー自身を削除しようとした場合" do
          it 'userを削除しない' do
            params = { id: admin.id }
            expect do
              delete :destroy, params: params
            end.to_not change(User, :count)
          end
          it 'トップページにリダイレクトする' do
            params = { id: admin.id }
            delete :destroy, params: params
            expect(response).to redirect_to(root_path)
          end
        end
      end

      context '管理ユーザーでない場合' do
        before do
          login user
        end
        it 'userを削除しない' do
          params = { id: other.id }
          expect do
            delete :destroy, params: params
          end.to_not change(User, :count)
        end
        it 'トップページにリダイレクトする' do
          params = { id: other.id }
          delete :destroy, params: params
          expect(response).to redirect_to(root_path)
        end
      end
    end

    context 'ログインしていない場合' do
      it 'userを削除しない' do
        params = { id: user.id }
        expect do
          delete :destroy, params: params
        end.to_not change(User, :count)
      end
      it 'ログインページにリダイレクトする' do
        params = { id: user.id }
        delete :destroy, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
