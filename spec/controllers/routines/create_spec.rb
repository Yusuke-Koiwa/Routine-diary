require 'rails_helper'
describe RoutinesController do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:params) { { routine: { content: "hoge", category_id: category.id } } }

  describe '#create' do
    context 'ログインしている場合' do
      before do
        login user
        create(:routine, user: user)
        create(:routine, user: user)
      end

      context 'routineの登録数が2つ以下の場合' do
        subject { post :create, params: params }
        it 'routineを保存する' do
          expect { subject }.to change(Routine, :count).by(1)
        end
        it 'マイページにリダイレクトする' do
          subject
          expect(response).to redirect_to(user_path(user))
        end
      end

      context 'routineが既に3つ存在する場合' do
        before do
          create(:routine, user: user)
        end
        subject { post :create, params: params }

        it 'routineを保存しない' do
          expect { subject }.not_to change(Routine, :count)
        end
        it 'マイページにリダイレクトする' do
          subject
          expect(response).to redirect_to(user_path(user))
        end
      end
    end

    context 'ログインしていない場合' do
      subject { post :create, params: params }
      it 'routineを保存しない' do
        expect { subject }.not_to change(Routine, :count)
      end
      it 'ログインページにリダイレクトする' do
        subject
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
