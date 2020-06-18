require 'rails_helper'
feature 'devise', type: :feature do
  let(:user) { create(:user) }

  scenario '非ログイン時の表示' do
    category = create(:category)
    visit root_path
    expect(page).to have_no_content('マイページ')
  end

  scenario 'ログインを実行' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'ログイン'
    expect(current_path).to eq user_path(user)
    expect(page).to have_content('マイページ')
  end

  scenario 'ログアウトを実行' do
    category = create(:category)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'ログイン'
    expect(current_path).to eq user_path(user)
    expect(page).to have_content('マイページ')
    click_link 'ログアウト'
    expect(current_path).to eq root_path
    expect(page).to have_no_content('マイページ')
  end

  scenario '新規登録を実行' do
    visit new_user_registration_path
    expect do
      fill_in 'user_name', with: 'new_user'
      fill_in 'user_email', with: 'new@test.com'
      fill_in 'user_password', with: '1234567'
      fill_in 'user_password_confirmation', with: '1234567'
      click_button 'アカウント作成'
      new_user = User.last
      expect(current_path).to eq user_path(new_user)
    end.to change(User, :count).by(1)
  end
end
