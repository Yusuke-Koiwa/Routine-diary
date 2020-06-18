require 'rails_helper'
describe RoutinesController do
  let(:user) { create(:user) }
  let(:other) { create(:user) }
  let(:routine) { create(:routine, user: user) }
  let(:other_routine) { create(:routine, user: other)}

  describe '#destroy' do
    context 'ログインしている場合' do
      before do
        login user
      end
        
      context "自分が作成したroutineを削除する場合" do
        it 'routineを削除する' do
          params = { id: routine.id }
          expect {
            delete :destroy, params: params
          }.to change(Routine, :count).by(-1)
          
        end
        it 'マイページにリダイレクトする' do
          params = { id: routine.id }
          delete :destroy, params: params
          expect(response).to redirect_to(user_path(user))
        end
      end

      context '他ユーザーのroutineを削除しようとした場合' do
        it 'routineを削除しない' do
          params = { id: other_routine.id }
          expect {
            delete :destroy, params: params
          }.to_not change(Routine, :count)
        end
        it 'マイページにリダイレクトする' do
          params = { id: other_routine.id }
          delete :destroy, params: params
          expect(response).to redirect_to(user_path(other))
        end
      end
    end

    context 'ログインしていない場合' do
      it 'routineを削除しない' do
        params = { id: routine.id }
        expect {
          delete :destroy, params: params
        }.to_not change(Routine, :count)
      end
      it 'ログインページにリダイレクトする' do
        params = { id: routine.id }
        delete :destroy, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end