require 'rails_helper'

RSpec.describe 'コメント機能', type: :system do
  before do
    @comment = FactoryBot.create(:comment)
  end

  context 'コメントに失敗したとき' do
    it '送る値が空の為、コメントの送信に失敗すること' do
      # サインインする
      sign_in(@comment.user)
      # 予定リストを開く
      find('.openbtn1').click
      # 予定表をクリック
      find('.department-name').click
      # DBに保存されていないことを確認する
      expect do
        find('input[name="commit"]').click
      end.not_to change { Comment.count }
      # エラーダイアログが表示される
      expect(page.accept_confirm).to eq 'Error： コメントに何も入力されていません'
    end
  end

  context 'コメントに成功したとき' do
    it 'コメントの投稿に成功すると、コメント一覧に内容が表示されている' do
      # サインインする
      sign_in(@comment.user)
      # 予定リストを開く
      find('.openbtn1').click
      # 予定表をクリック
      find('.department-name').click
      # 値をテキストフォームに入力する
      wait_for_ajax
      fill_in 'comment[text]', with: @comment.text
      # コメントを投稿する
      find('input[name="commit"]').click
      # 送信した値がブラウザに表示されていることを確認する
      expect(page).to have_content(@comment.text)
    end

    it '画像の投稿に成功すると、投稿一覧に遷移して、投稿した画像が表示されている' do
      # サインインする
      sign_in(@comment.user)
      # 予定リストを開く
      find('.openbtn1').click
      # 予定表をクリック
      find('.department-name').click
      # 添付する画像を定義する
      wait_for_ajax
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('comment[image]', image_path, make_visible: true)
      # 画像を投稿する
      find('input[name="commit"]').click
      # 送信した画像がブラウザに表示されていることを確認する
      expect(page).to have_selector('img')
    end

    it 'テキストと画像の投稿に成功すること' do
      # サインインする
      sign_in(@comment.user)
      # 予定リストを開く
      find('.openbtn1').click
      # 予定表をクリック
      find('.department-name').click
      # 添付する画像を定義する
      wait_for_ajax
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('comment[image]', image_path, make_visible: true)
      # 値をテキストフォームに入力する
      fill_in 'comment[text]', with: @comment.text
      # コメントを投稿する
      find('input[name="commit"]').click
      # 送信した値がブラウザに表示されていることを確認する
      expect(page).to have_content(@comment.text)
      # 送信した画像がブラウザに表示されていることを確認する
      expect(page).to have_selector('img')
    end
  end
end
