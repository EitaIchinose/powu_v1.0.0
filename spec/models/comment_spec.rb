require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント送信' do
    context 'コメントを送信出来る時' do
      it 'text、画像が存在すればコメントを送信できる' do
        expect(@comment).to be_valid
      end

      it 'textが空でもコメントを送信できる' do
        @comment.text = ''
        expect(@comment).to be_valid
      end

      it '画像が空でもコメントを送信できる' do
        @comment.image = nil
        expect(@comment).to be_valid
      end
    end

    context 'コメントを送信出来ない時' do
      it 'textと画像が空の場合、送信できない' do
        @comment.text = ''
        @comment.image = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('文を入力してください')
      end

      it 'departmentが紐付いていないと、送信できない' do
        @comment.department = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Departmentを入力してください")
      end

      it 'userが紐付いていないと、送信できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
