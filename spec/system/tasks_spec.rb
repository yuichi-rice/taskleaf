require 'rails_helper'


describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      user_a = FactoryBot.create(:users, name: 'ユーザーA', email: 'a@example.com')
      FactoryBot.create(:tasks, name: '最初のタスク', user: user_a)
    end

    context 'ユーザーAがログインしているとき' do
      before do
        visit login_path
        fill_in 'メールアドレス', with: 'a@example.com'
        fill_in 'パスワード', with: 'password'
        click_buttton 'ログインする'
      end

      it 'ユーザーAが作製したタスクが表示される' do
        expect(page).to have_content '最初のタスク'
      end
    end
  end
end

