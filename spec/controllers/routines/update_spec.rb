require 'rails_helper'
describe RoutinesController do
  let(:user) { create(:user) }
  let(:other) { create(:user) }
  let(:routine) { create(:routine, content: "old", user: user) }
  let(:other_routine) { create(:routine, content: "old", user: other)}

  describe '#update' do

    context 'ログインしている場合' do
      before do
        login user
      end
        
      context "自分が作成したroutineを更新する場合" do
        it 'routineを更新する' do
          params = {id: routine.id, routine: {content: "new"}}
          patch :update, params: params
          expect(routine.reload.content).to eq("new")
        end
        it 'マイページにリダイレクトする' do
          params = {id: routine.id, routine: {content: "new"}}
          patch :update, params: params
          expect(response).to redirect_to(user_path(user))
        end
      end

      context '他ユーザーのroutineを更新しようとした場合' do
        it 'routineを更新しない' do
          params = {id: other_routine.id, routine: {content: "new"}}
          patch :update, params: params
          expect(other_routine.reload.content).to eq("old")
        end
        it 'ユーザー詳細ページにリダイレクトする' do
          params = {id: other_routine.id, routine: {content: "new"}}
          patch :update, params: params
          expect(response).to redirect_to(user_path(other))
        end
      end

    end

    context 'ログインしていない場合' do
      it 'routineを更新しない' do
        params = {id: routine.id, routine: {content: "new"}}
        patch :update, params: params
        expect(routine.reload.content).to eq("old")
      end
      it 'ログインページにリダイレクトする' do
        params = {id: routine.id, routine: {content: "new"}}
        patch :update, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end

end