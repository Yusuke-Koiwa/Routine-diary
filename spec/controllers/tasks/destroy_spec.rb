require 'rails_helper'
describe TasksController do
  let(:user) { create(:user) }
  let(:other) { create(:user) }
  let(:task) { create(:task, user: user) }
  let(:other_user_task) { create(:task, user: other) }

  describe '#destroy' do
    context 'ログインしている場合' do
      before do
        login user
      end

      context "自分が作成したtaskを削除する場合" do
        it 'taskを削除する' do
          params = { id: task.id }
          expect {
            delete :destroy, params: params
          }.to change(Task, :count).by(-1)
        end
        it 'マイページにリダイレクトする' do
          params = { id: task.id }
          delete :destroy, params: params
          expect(response).to redirect_to(user_path(user))
        end
      end

      context '他ユーザーのtaskを削除しようとした場合' do
        it 'taskを削除しない' do
          params = { id: other_user_task.id }
          expect {
            delete :destroy, params: params
          }.to_not change(Task, :count)
        end
        it 'マイページにリダイレクトする' do
          params = { id: other_user_task.id }
          delete :destroy, params: params
          expect(response).to redirect_to(user_path(user))
        end
      end
    end

    context 'ログインしていない場合' do
      it 'taskを削除しない' do
        params = { id: task.id }
        expect {
          delete :destroy, params: params
        }.to_not change(Task, :count)
      end
      it 'ログインページにリダイレクトする' do
        params = { id: task.id }
        delete :destroy, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
