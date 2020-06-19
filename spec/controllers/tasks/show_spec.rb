require 'rails_helper'
describe TasksController do
  let(:user) { create(:user) }

  describe '#show' do
    context 'ログインしている場合' do
      before do
        login user
        get :index
      end
      it "@taskに正しい値が入っている" do
        task = create(:task)
        get :show, params: { id: task }
        expect(assigns(:task)).to eq task
      end
      it "show.html.erbに遷移する" do
        task = create(:task)
        get :show, params: { id: task }
        expect(response).to render_template :show
      end
    end

    context 'ログインしていない場合' do
      it "ログインページにリダイレクトする" do
        task = create(:task)
        get :show, params: { id: task }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
